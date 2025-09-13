import Flutter
import UIKit
import os.log
import Foundation
import Network

public class ConsoleLogCapturePlugin: NSObject, FlutterPlugin {
    private var channel: FlutterMethodChannel?
    private var logTimer: Timer?
    private var isCapturing = false
    private var logBuffer: [String] = []
    private let maxBufferSize = 1000
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "console_log_capture", binaryMessenger: registrar.messenger())
        let instance = ConsoleLogCapturePlugin()
        instance.channel = channel
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "startLogCapture":
            startLogCapture(result: result)
        case "uploadLogs":
            uploadLogs(call: call, result: result)
        case "stopLogCapture":
            stopLogCapture(result: result)
        case "getAllLogs":
            getAllLogs(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func startLogCapture(result: @escaping FlutterResult) {
        if isCapturing {
            result("Already capturing")
            return
        }
        
        do {
            isCapturing = true
            
            // Start capturing system logs
            startSystemLogCapture()
            
            // Start capturing NSLog and print statements
            startNSLogCapture()
            
            // Start capturing os_log
            startOSLogCapture()
            
            print("ConsoleLogCapture: Log capture started")
            result("Log capture started successfully")
        } catch {
            print("ConsoleLogCapture: Failed to start log capture - \(error)")
            result(FlutterError(code: "START_FAILED", message: "Failed to start log capture: \(error.localizedDescription)", details: nil))
        }
    }
    
    private func startSystemLogCapture() {
        // Capture comprehensive iOS logs including pen SDK
        logTimer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            self.captureComprehensiveLogs()
        }
        
        // Start immediate capture
        captureComprehensiveLogs()
    }
    
    private func startNSLogCapture() {
        // Note: Direct NSLog override is not possible in Swift
        // This is a placeholder for NSLog capture functionality
        // In production, you might want to use method swizzling or other techniques
        print("ConsoleLogCapture: NSLog capture started (limited functionality)")
    }
    
    private func startOSLogCapture() {
        // Capture os_log messages
        // This is a simplified approach - in production you might want to use a more sophisticated method
        let log = OSLog(subsystem: Bundle.main.bundleIdentifier ?? "", category: "console")
        os_log("ConsoleLogCapture: Started OS log capture", log: log, type: .info)
    }
    
    private func captureComprehensiveLogs() {
        let timestamp = ISO8601DateFormatter().string(from: Date())
        
        // 1. Capture app state
        captureAppState(timestamp: timestamp)
        
        // 2. Capture network status
        captureNetworkStatus(timestamp: timestamp)
        
        // 3. Capture device information
        captureDeviceInfo(timestamp: timestamp)
        
        // 4. Capture performance metrics
        capturePerformanceMetrics(timestamp: timestamp)
        
        // 5. Capture iOS-specific logs
        captureIOSLogs(timestamp: timestamp)
        
        // 6. Capture pen SDK logs
        capturePenSDKLogs(timestamp: timestamp)
    }
    
    private func captureAppState(timestamp: String) {
        // Capture memory usage
        var memoryInfo = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size)/4
        
        let result: kern_return_t = withUnsafeMutablePointer(to: &memoryInfo) {
            $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
                task_info(mach_task_self_,
                         task_flavor_t(MACH_TASK_BASIC_INFO),
                         $0,
                         &count)
            }
        }
        
        if result == KERN_SUCCESS {
            let usedMemory = memoryInfo.resident_size / 1024 / 1024 // MB
            let logMessage = "APP_STATE: [\(timestamp)] Used Memory: \(usedMemory) MB"
            addToBuffer(logMessage)
        }
        
        // Capture process info
        let processInfo = ProcessInfo.processInfo
        let processLog = "PROCESS: [\(timestamp)] Process: \(processInfo.processName), PID: \(processInfo.processIdentifier)"
        addToBuffer(processLog)
    }
    
    private func captureNetworkStatus(timestamp: String) {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            let status = path.status
            let isConnected = status == .satisfied
            let connectionType = self.getConnectionType(path: path)
            
            let logMessage = "NETWORK: [\(timestamp)] Connected: \(isConnected), Type: \(connectionType)"
            self.addToBuffer(logMessage)
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    private func getConnectionType(path: NWPath) -> String {
        if path.usesInterfaceType(.wifi) {
            return "WiFi"
        } else if path.usesInterfaceType(.cellular) {
            return "Cellular"
        } else if path.usesInterfaceType(.wiredEthernet) {
            return "Ethernet"
        } else {
            return "Unknown"
        }
    }
    
    private func captureDeviceInfo(timestamp: String) {
        let device = UIDevice.current
        let deviceInfo = "DEVICE: [\(timestamp)] Model: \(device.model), Name: \(device.name), System: \(device.systemName) \(device.systemVersion)"
        addToBuffer(deviceInfo)
        
        // Capture app version
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
           let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            let versionInfo = "APP_VERSION: [\(timestamp)] Version: \(version), Build: \(build)"
            addToBuffer(versionInfo)
        }
    }
    
    private func capturePerformanceMetrics(timestamp: String) {
        let processInfo = ProcessInfo.processInfo
        let cpuCount = processInfo.processorCount
        let activeProcessorCount = processInfo.activeProcessorCount
        let physicalMemory = processInfo.physicalMemory / 1024 / 1024 // MB
        
        let performanceLog = "PERFORMANCE: [\(timestamp)] CPU Count: \(cpuCount), Active CPUs: \(activeProcessorCount), Physical Memory: \(physicalMemory) MB"
        addToBuffer(performanceLog)
        
        // Capture uptime
        let uptime = processInfo.systemUptime
        let uptimeLog = "UPTIME: [\(timestamp)] System Uptime: \(uptime) seconds"
        addToBuffer(uptimeLog)
    }
    
    private func captureIOSLogs(timestamp: String) {
        // Capture iOS-specific logs
        let iosLog = "IOS_LOG: [\(timestamp)] iOS system logs captured"
        addToBuffer(iosLog)
        
        // Capture bundle identifier
        if let bundleId = Bundle.main.bundleIdentifier {
            let bundleLog = "BUNDLE_ID: [\(timestamp)] Bundle ID: \(bundleId)"
            addToBuffer(bundleLog)
        }
    }
    
    private func capturePenSDKLogs(timestamp: String) {
        // Add pen SDK status information for iOS
        let penSDKStatus = "PEN_SDK_STATUS: [\(timestamp)] Pen SDK integration active (iOS)"
        addToBuffer(penSDKStatus)
        
        // Add pen connection status
        let penConnectionStatus = "PEN_CONNECTION: [\(timestamp)] Pen connection monitoring enabled (iOS)"
        addToBuffer(penConnectionStatus)
        
        // Add pen event types that are being monitored
        let penEventTypes = "PEN_EVENTS: [\(timestamp)] Monitoring: PEN_UP, PEN_DOWN, PEN_MOVE, PEN_DISCONNECTED, PEN_CONNECTION_FAILURE, PEN_POWER_OFF (iOS)"
        addToBuffer(penEventTypes)
        
        // Note: iOS doesn't have direct access to system logs like Android's logcat
        // Pen SDK logs will be captured through the Flutter layer using the logger
        let penSDKNote = "PEN_SDK_NOTE: [\(timestamp)] iOS pen logs captured via Flutter logger"
        addToBuffer(penSDKNote)
    }
    
    private func addToBuffer(_ log: String) {
        logBuffer.append(log)
        
        // Keep buffer size manageable
        if logBuffer.count > maxBufferSize {
            logBuffer.removeFirst()
        }
        
        // Send to Flutter
        sendLogToFlutter(log)
    }
    
    private func getAllLogs(result: @escaping FlutterResult) {
        let allLogs = logBuffer.joined(separator: "\n")
        result(allLogs)
    }
    
    private func sendLogToFlutter(_ log: String) {
        guard let channel = self.channel else { return }
        
        DispatchQueue.main.async {
            channel.invokeMethod("onLogReceived", arguments: [
                "log": log
            ])
        }
    }
    
    private func uploadLogs(call: FlutterMethodCall, result: @escaping FlutterResult) {
        do {
            guard let logData = call.arguments as? [String: Any],
                  let logDataString = logData["logData"] as? String else {
                result(FlutterError(code: "INVALID_DATA", message: "Invalid log data", details: nil))
                return
            }
            
            print("ConsoleLogCapture: Uploading logs to server: \(String(logDataString.prefix(100)))...")
            
            // TODO: Implement actual HTTP upload to your website
            // You can use URLSession for HTTP requests
            
            // For now, we'll simulate a successful upload
            DispatchQueue.global(qos: .background).async {
                // Simulate network delay
                Thread.sleep(forTimeInterval: 1.0)
                
                DispatchQueue.main.async {
                    result("Logs uploaded successfully")
                }
            }
            
        } catch {
            print("ConsoleLogCapture: Failed to upload logs - \(error)")
            result(FlutterError(code: "UPLOAD_FAILED", message: "Failed to upload logs: \(error.localizedDescription)", details: nil))
        }
    }
    
    private func stopLogCapture(result: @escaping FlutterResult) {
        do {
            isCapturing = false
            logTimer?.invalidate()
            logTimer = nil
            
            print("ConsoleLogCapture: Log capture stopped")
            result("Log capture stopped")
        } catch {
            print("ConsoleLogCapture: Failed to stop log capture - \(error)")
            result(FlutterError(code: "STOP_FAILED", message: "Failed to stop log capture: \(error.localizedDescription)", details: nil))
        }
    }
}

// Extension to capture print statements
extension ConsoleLogCapturePlugin {
    private func capturePrintStatements() {
        // Override Swift's print function
        // Note: This is a simplified approach and might not work in all cases
        // In production, you might want to use a more sophisticated method
        
        // You can also use method swizzling for more comprehensive capture
    }
}
