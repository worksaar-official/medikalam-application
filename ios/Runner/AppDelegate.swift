import Flutter
import UIKit

@main
@objc
class AppDelegate: FlutterAppDelegate, AFPenCommParserStrokeHandler, AFPenCommManagerNewPeripheral,
    AFOfflineDataDelegate
{
    func processConnectionStatus(_ connectionStatus: AFPenCommManPenConnectionStatus) {
        var ret: [String: Any] = [:]
        let status = AFPenCommManPenConnectionStatus(rawValue: connectionStatus.rawValue)!

        print("iOS AFPenSDK Connection Status: \(connectionStatus.rawValue)")
        
        switch status {
        case .scanStarted:
            print("Pen scan started")
            return // Don't send event for scan start
            
        case .connected:
            print("Pen connected successfully")
            ret = [
                "success": 1,
                "penMsgType": PenMsgType.connected.rawValue
            ]
            
            // Enable auto-reconnect when pen connects successfully and stop any running timer
            isAutoReconnectEnabled = true
            stopAutoReconnectTimer() // Stop timer when successfully connected
            print("Auto-reconnect enabled after successful connection, timer stopped")
            
        case .disconnected:
            print("Pen disconnected")
            ret = [
                "disconnected": 0,
                "penMsgType": PenMsgType.disConnected.rawValue
            ]
            
            // Start auto-reconnect timer when pen disconnects (only if user is logged in)
            if isUserLoggedIn && isAutoReconnectEnabled {
                print("Starting auto-reconnect timer after disconnect")
                startAutoReconnectTimer()
            }
            
        case .connectTimeout:
            print("Pen connection timeout")
            ret = [
                "disconnected": 0,
                "penMsgType": PenMsgType.connectionFailure.rawValue,
                "error": "Connection timeout"
            ]
            
        default:
            print("Unknown connection status: \(connectionStatus.rawValue)")
            return
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: ret, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("Sending connection status event: \(jsonString)")
                self.eventSinkIAFPenMsg?(jsonString)
            }
        } catch {
            print("Failed to serialize connection status: \(error)")
        }
    }

    func afPenCommDidReceiveList(_ penList: [AFDevice]!) {
        guard let penList = penList, !penList.isEmpty else { return }
        
        // Process all pens in the list, not just the first one
        for pen in penList {
            var advertisementDataDict = pen.advertisementData as? [String: Any] ?? [:]

            if let manufacturerData = advertisementDataDict["kCBAdvDataManufacturerData"] as? Data {
                let hexString = hexString(from: manufacturerData)
                advertisementDataDict["kCBAdvDataManufacturerData"] = hexString
            }
            
            let ret: [String: Any] = [
                "penMsgType": PenMsgType.findDevice.rawValue,
                "STRING_PEN_MAC_ADDRESS": pen.macAddress,
                "STRING_DEVICE_NAME": pen.name,
                "STRING_DEVICE_RSSI": pen.rssi,
                "STRING_DEVICE_ADVDATA": advertisementDataDict,
            ]
            
            penDictionary.updateValue(ret, forKey: pen.macAddress)
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: ret, options: .prettyPrinted)
                if let jsonString = String(data: jsonData, encoding: .utf8) {
                    self.eventSinkIAFPenMsg?(jsonString)
                }
            } catch {
                print("Failed to serialize pen data: \(error)")
            }
        }
    }
    
    // Add the missing method that iOS AFPenSDK actually calls
    func afPenCommDidReceivePeripheralList(_ penList: [AFDevice]!) {
        afPenCommDidReceiveList(penList)
    }

    func processNode(_ arrAFNode: [AFNode]!) {
        let jsonStrings = convertNodesToJSONString(nodes: arrAFNode)
        for jsonString in jsonStrings {
            self.eventSinkIAFPenDot?(jsonString)
        }
    }

    func onReceive(_ penGripStyle: PenGripStyle) {
        //if support PenGripStyle function
    }

    func rawResponse(_ data: Data!) {
        //reserved
    }

    func offlineDataDidReceiveDataInfo(_ infoDictionary: [AnyHashable: Any]!) {
        //todo
    }

    func offlineDataDidReceivePenData(_ dataDictionary: [AnyHashable: Any]!) {
        //todo
    }

    private let CHANNEL = "com.afpensdk.pen.dpenctrl"
    private let EVENT_CHANNEL_MSG = "com.afpensdk.pen.dpenctrl/penMsgStream"
    private let EVENT_CHANNEL_DOT = "com.afpensdk.pen.dpenctrl/penDotStream"

    private var eventSinkIAFPenMsg: FlutterEventSink?
    private var eventSinkIAFPenDot: FlutterEventSink?
    private var msgStreamHandler: StreamHandler?
    private var dotStreamHandler: StreamHandler?
    private var pendingResult: FlutterResult?
    var penDictionary = [String: Any]()
    
    // Auto-reconnect properties
    private var reconnectTimer: Timer?
    private var isUserLoggedIn = false
    private var lastConnectedPenMac: String?
    private var lastConnectedPenName: String?
    private var isAutoReconnectEnabled = false
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        // Register console log capture plugin
        if let registrar = self.registrar(forPlugin: "ConsoleLogCapturePlugin") {
            ConsoleLogCapturePlugin.register(with: registrar)
        }
        
        let controller = window?.rootViewController as! FlutterViewController
        let binaryMessenger = controller.binaryMessenger

        let msgChannel = FlutterEventChannel(
            name: EVENT_CHANNEL_MSG, binaryMessenger: binaryMessenger)
        msgStreamHandler = StreamHandler(eventSinkUpdater: { [weak self] sink in
            self?.eventSinkIAFPenMsg = sink
        })
        msgChannel.setStreamHandler(msgStreamHandler)

        let dotChannel = FlutterEventChannel(
            name: EVENT_CHANNEL_DOT, binaryMessenger: binaryMessenger)
        dotStreamHandler = StreamHandler(eventSinkUpdater: { [weak self] sink in
            self?.eventSinkIAFPenDot = sink
        })
        dotChannel.setStreamHandler(dotStreamHandler)

        AFPenCommManager.sharedInstance().setAFPenCommParserStrokeHandler(self)
        AFPenCommManager.sharedInstance().setAFPenCommManagerNewPeripheral(self)
        AFPenCommManager.sharedInstance().setAFOfflineDataDelegate(self)
        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: binaryMessenger)
        methodChannel.setMethodCallHandler {
            [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            guard let self = self else { return }
            if call.method == "btStartForPeripheralsList" {
                print("Starting BLE scan for peripherals...")
                let ret = AFPenCommManager.sharedInstance().btStartForPeripheralsList()
                print("BLE scan start result: \(ret.rawValue)")
                result(ret.rawValue)
            } else if call.method == "connect" {
                if let args = call.arguments as? [String: Any],
                    let address = args["addr"] as? String
                {
                    print("Attempting to connect to pen with MAC: \(address)")
                    print("Available pens in dictionary: \(self.penDictionary.keys)")
                    
                    if let penData = penDictionary[address] as? [String: Any],
                        let name = penData["STRING_DEVICE_NAME"] as? String
                    {
                        print("Connecting to pen: \(name) with MAC: \(address)")
                        
                        // Store pen info for auto-reconnect
                        lastConnectedPenMac = address
                        lastConnectedPenName = name
                        
                        let connectResult = AFPenCommManager.sharedInstance().connect(name)
                        print("Connect method returned: \(connectResult)")
                        
                        // Stop auto-reconnect timer when manually connecting
                        stopAutoReconnectTimer()
                        
                        result(connectResult)
                    } else {
                        print("No valid pen data found for the given address: \(address)")
                        print("Available pen data: \(self.penDictionary)")
                        result(false)
                    }
                } else {
                    print("Invalid connect arguments")
                    result(false)
                }
            } else if call.method == "disconnect" {
                print("Disconnecting pen...")
                AFPenCommManager.sharedInstance().disConnect()
                result(true)

            } else if call.method == "setContext" || call.method == "setListener" {
                let paperSize = PaperSize()
                paperSize.height = 7014
                paperSize.width = 4962
                paperSize.pageFrom = 0
                paperSize.pageTo = 1000
                paperSize.bookNum = 1
                let paperSizeList: [PaperSize] = [paperSize]
                AFPenCommManager.sharedInstance().setPaperSize(paperSizeList)
                print("Paper size configured and listener set")
                result(nil)
            } else if call.method == "isConnected" {
                let isConnected = AFPenCommManager.sharedInstance().isConnected()
                print("Pen connection status: \(isConnected)")
                result(isConnected)
            } else if call.method == "getConnectionStatus" {
                let status = AFPenCommManager.sharedInstance().getConnectionStatus()
                print("Pen connection status value: \(status.rawValue)")
                result(status.rawValue)
            } else if call.method == "setUserLoginStatus" {
                if let args = call.arguments as? [String: Any],
                   let isLoggedIn = args["isLoggedIn"] as? Bool {
                    print("Setting user login status: \(isLoggedIn)")
                    isUserLoggedIn = isLoggedIn
                    
                    if isLoggedIn {
                        print("User logged in - auto-reconnect available")
                        // Don't start timer immediately, wait for disconnect event
                    } else {
                        print("User logged out - stopping auto-reconnect")
                        stopAutoReconnectTimer()
                        isAutoReconnectEnabled = false
                        lastConnectedPenMac = nil
                        lastConnectedPenName = nil
                    }
                    result(true)
                } else {
                    result(false)
                }
            } else if call.method == "setAutoReconnectEnabled" {
                if let args = call.arguments as? [String: Any],
                   let enabled = args["enabled"] as? Bool {
                    print("Setting auto-reconnect enabled: \(enabled)")
                    isAutoReconnectEnabled = enabled
                    
                    if !enabled {
                        stopAutoReconnectTimer()
                    }
                    result(true)
                } else {
                    result(false)
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // Helper method to convert Data to hex string
    private func hexString(from data: Data) -> String {
        return data.map { String(format: "%02x", $0) }.joined()
    }
    
    // MARK: - Auto Reconnect Methods
    
    private func startAutoReconnectTimer() {
        print("Starting auto-reconnect timer (5 seconds interval)")
        stopAutoReconnectTimer() // Stop any existing timer
        
        reconnectTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            self?.checkAndReconnectPen()
        }
    }
    
    private func stopAutoReconnectTimer() {
        print("Stopping auto-reconnect timer")
        reconnectTimer?.invalidate()
        reconnectTimer = nil
    }
    
    private func checkAndReconnectPen() {
        // Only check if user is logged in and auto-reconnect is enabled
        guard isUserLoggedIn && isAutoReconnectEnabled else {
            print("Auto-reconnect skipped: userLoggedIn=\(isUserLoggedIn), autoReconnectEnabled=\(isAutoReconnectEnabled)")
            return
        }
        
        // Only check if we're not currently connected
        guard !AFPenCommManager.sharedInstance().isConnected() else {
            print("Pen already connected, skipping reconnect check")
            return
        }
        
        // Only check if we have a previously connected pen
        guard let savedMac = lastConnectedPenMac,
              let savedName = lastConnectedPenName else {
            print("No previously connected pen found for auto-reconnect")
            return
        }
        
        print("Checking pen availability for auto-reconnect: \(savedName) (\(savedMac))")
        
        // Clear pen dictionary to force fresh scan
        penDictionary.removeAll()
        print("Cleared pen dictionary for fresh scan")
        
        // Start scanning to see if pen is available
        let scanResult = AFPenCommManager.sharedInstance().btStartForPeripheralsList()
        print("Auto-reconnect scan started with result: \(scanResult.rawValue)")
        
        // Send scan event to Flutter to ensure event listeners are active
        let scanEvent: [String: Any] = [
            "autoReconnectScan": true,
            "targetMac": savedMac,
            "targetName": savedName
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: scanEvent, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                self.eventSinkIAFPenMsg?(jsonString)
            }
        } catch {
            print("Failed to serialize scan event: \(error)")
        }
        
        // Give some time for scan to find devices
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.attemptAutoReconnect(mac: savedMac, name: savedName)
        }
    }
    
    private func attemptAutoReconnect(mac: String, name: String) {
        // Check if pen is in our discovered list
        if let penData = penDictionary[mac] as? [String: Any],
           let deviceName = penData["STRING_DEVICE_NAME"] as? String {
            
            print("Auto-reconnecting to pen: \(deviceName) (\(mac))")
            let connectResult = AFPenCommManager.sharedInstance().connect(deviceName)
            print("Auto-reconnect attempt result: \(connectResult)")
            
            if connectResult {
                print("Auto-reconnect initiated successfully")
                // Notify Flutter about auto-reconnect attempt
                let ret: [String: Any] = [
                    "autoReconnectAttempt": true,
                    "penMac": mac,
                    "penName": deviceName
                ]
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: ret, options: .prettyPrinted)
                    if let jsonString = String(data: jsonData, encoding: .utf8) {
                        self.eventSinkIAFPenMsg?(jsonString)
                    }
                } catch {
                    print("Failed to serialize auto-reconnect event: \(error)")
                }
                
                // The actual connection success will be handled by processConnectionStatus
                // which will stop the timer when connection is confirmed
            } else {
                print("Auto-reconnect initiation failed")
            }
        } else {
            print("Previously connected pen not found in current scan: \(mac)")
        }
    }
}

class StreamHandler: NSObject, FlutterStreamHandler {
    private var eventSink: FlutterEventSink?
    private let eventSinkUpdater: (FlutterEventSink?) -> Void

    init(eventSinkUpdater: @escaping (FlutterEventSink?) -> Void) {
        self.eventSinkUpdater = eventSinkUpdater
        super.init()
    }

    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
        -> FlutterError?
    {
        eventSink = events
        eventSinkUpdater(events)
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        eventSinkUpdater(nil)
        return nil
    }
}
