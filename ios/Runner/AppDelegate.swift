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

        if status == AFPenCommManPenConnectionStatus.scanStarted {
        } else if status == AFPenCommManPenConnectionStatus.connected {
            ret = [
                "success": 1
            ]
        } else if status == AFPenCommManPenConnectionStatus.disconnected {
            ret = [
                "disconnected": 0
            ]
        }
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: ret, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                self.eventSinkIAFPenMsg?(jsonString)
            }
        } catch {

        }
    }

    func afPenCommDidReceiveList(_ penList: [AFDevice]!) {
        guard let pen = penList.first else { return }
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

        }

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
                let ret = AFPenCommManager.sharedInstance().btStartForPeripheralsList()
                result(ret.rawValue)
            } else if call.method == "connect" {
                if let args = call.arguments as? [String: Any],
                    let address = args["addr"] as? String
                {
                    print(self.penDictionary)
                    if let penData = penDictionary[address] as? [String: Any],
                        let name = penData["STRING_DEVICE_NAME"] as? String
                    {
                        AFPenCommManager.sharedInstance().connect(name)
                    } else {
                        print("No valid pen data found for the given address.")
                    }
                }
            } else if call.method == "disconnect" {
                AFPenCommManager.sharedInstance().disConnect()
                result(nil)

            } else if call.method == "setContext" || call.method == "setListener" {
                let paperSize = PaperSize()
                paperSize.height = 7014
                paperSize.width = 4962
                paperSize.pageFrom = 0
                paperSize.pageTo = 1000
                paperSize.bookNum = 1
                let paperSizeList: [PaperSize] = [paperSize]
                AFPenCommManager.sharedInstance().setPaperSize(paperSizeList)
                result(nil)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
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
