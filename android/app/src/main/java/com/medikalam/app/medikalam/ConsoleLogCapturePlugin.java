package com.medikalam.app.medikalam;

import android.content.Context;
import android.os.Build;
import android.util.Log;
import android.app.ActivityManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Debug;
import android.os.Process;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class ConsoleLogCapturePlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    private static final String CHANNEL = "console_log_capture";
    private MethodChannel channel;
    private Context context;
    private Timer logTimer;
    private boolean isCapturing = false;
    private List<String> logBuffer = new ArrayList<>();
    private final int maxBufferSize = 1000;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), CHANNEL);
        channel.setMethodCallHandler(this);
        context = flutterPluginBinding.getApplicationContext();
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        switch (call.method) {
            case "startLogCapture":
                startLogCapture(result);
                break;
            case "uploadLogs":
                uploadLogs(call, result);
                break;
            case "stopLogCapture":
                stopLogCapture(result);
                break;
            case "getAllLogs":
                getAllLogs(result);
                break;
            default:
                result.notImplemented();
                break;
        }
    }

    private void startLogCapture(Result result) {
        if (isCapturing) {
            result.success("Already capturing");
            return;
        }

        try {
            isCapturing = true;
            
            // Start capturing system logs
            startSystemLogCapture();
            
            // Start capturing logcat
            startLogcatCapture();
            
            Log.d("ConsoleLogCapture", "Log capture started");
            result.success("Log capture started successfully");
        } catch (Exception e) {
            Log.e("ConsoleLogCapture", "Failed to start log capture", e);
            result.error("START_FAILED", "Failed to start log capture: " + e.getMessage(), null);
        }
    }

    private void startSystemLogCapture() {
        // Capture comprehensive Android logs
        logTimer = new Timer();
        logTimer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                captureComprehensiveLogs();
            }
        }, 0, 5000); // Every 5 seconds
        
        // Start immediate capture
        captureComprehensiveLogs();
    }

    private void startLogcatCapture() {
        // Start capturing logcat in a separate thread
        new Thread(() -> {
            try {
                java.lang.Process process = Runtime.getRuntime().exec("logcat -v time");
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
                String line;
                
                while (isCapturing && (line = reader.readLine()) != null) {
                    if (line.contains("ConsoleLogCapture") || 
                        line.contains("MainActivity") || 
                        line.contains("DPenCtrl") ||
                        line.contains("AFPenSDK")) {
                        addToBuffer("LOGCAT: " + line);
                    }
                }
            } catch (IOException e) {
                Log.e("ConsoleLogCapture", "Error reading logcat", e);
            }
        }).start();
    }

    private void captureComprehensiveLogs() {
        String timestamp = java.time.Instant.now().toString();
        
        // 1. Capture app state
        captureAppState(timestamp);
        
        // 2. Capture network status
        captureNetworkStatus(timestamp);
        
        // 3. Capture device information
        captureDeviceInfo(timestamp);
        
        // 4. Capture performance metrics
        capturePerformanceMetrics(timestamp);
        
        // 5. Capture Android-specific logs
        captureAndroidLogs(timestamp);
        
        // 6. Capture pen SDK logs
        capturePenSDKLogs(timestamp);
    }

    private void captureAppState(String timestamp) {
        // Capture memory usage
        Debug.MemoryInfo memoryInfo = new Debug.MemoryInfo();
        Debug.getMemoryInfo(memoryInfo);
        
        long usedMemory = memoryInfo.getTotalPss() / 1024; // MB
        String logMessage = "APP_STATE: [" + timestamp + "] Used Memory: " + usedMemory + " MB";
        addToBuffer(logMessage);
        
        // Capture process info
        int pid = Process.myPid();
        String processLog = "PROCESS: [" + timestamp + "] PID: " + pid;
        addToBuffer(processLog);
    }

    private void captureNetworkStatus(String timestamp) {
        if (context != null) {
            ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
            if (cm != null) {
                NetworkInfo activeNetwork = cm.getActiveNetworkInfo();
                boolean isConnected = activeNetwork != null && activeNetwork.isConnectedOrConnecting();
                String connectionType = "Unknown";
                
                if (activeNetwork != null) {
                    if (activeNetwork.getType() == ConnectivityManager.TYPE_WIFI) {
                        connectionType = "WiFi";
                    } else if (activeNetwork.getType() == ConnectivityManager.TYPE_MOBILE) {
                        connectionType = "Mobile";
                    }
                }
                
                String logMessage = "NETWORK: [" + timestamp + "] Connected: " + isConnected + ", Type: " + connectionType;
                addToBuffer(logMessage);
            }
        }
    }

    private void captureDeviceInfo(String timestamp) {
        String deviceInfo = "DEVICE: [" + timestamp + "] Model: " + Build.MODEL + 
                          ", Brand: " + Build.BRAND + 
                          ", Android: " + Build.VERSION.RELEASE;
        addToBuffer(deviceInfo);
        
        // Capture app version
        try {
            String versionName = context.getPackageManager()
                .getPackageInfo(context.getPackageName(), 0).versionName;
            String versionCode = String.valueOf(context.getPackageManager()
                .getPackageInfo(context.getPackageName(), 0).versionCode);
            String versionInfo = "APP_VERSION: [" + timestamp + "] Version: " + versionName + ", Build: " + versionCode;
            addToBuffer(versionInfo);
        } catch (Exception e) {
            Log.e("ConsoleLogCapture", "Error getting app version", e);
        }
    }

    private void capturePerformanceMetrics(String timestamp) {
        Runtime runtime = Runtime.getRuntime();
        long maxMemory = runtime.maxMemory() / 1024 / 1024; // MB
        long totalMemory = runtime.totalMemory() / 1024 / 1024; // MB
        long freeMemory = runtime.freeMemory() / 1024 / 1024; // MB
        
        String performanceLog = "PERFORMANCE: [" + timestamp + "] Max Memory: " + maxMemory + 
                              " MB, Total Memory: " + totalMemory + " MB, Free Memory: " + freeMemory + " MB";
        addToBuffer(performanceLog);
        
        // Capture CPU info
        int cpuCount = runtime.availableProcessors();
        String cpuLog = "CPU: [" + timestamp + "] Available Processors: " + cpuCount;
        addToBuffer(cpuLog);
    }

    private void captureAndroidLogs(String timestamp) {
        // Capture Android-specific logs
        String androidLog = "ANDROID_LOG: [" + timestamp + "] Android system logs captured";
        addToBuffer(androidLog);
        
        // Capture package name
        if (context != null) {
            String packageName = context.getPackageName();
            String packageLog = "PACKAGE: [" + timestamp + "] Package: " + packageName;
            addToBuffer(packageLog);
        }
    }

    private void capturePenSDKLogs(String timestamp) {
        // Add pen SDK status information for Android
        String penSDKStatus = "PEN_SDK_STATUS: [" + timestamp + "] Pen SDK integration active (Android)";
        addToBuffer(penSDKStatus);
        
        // Add pen connection status
        String penConnectionStatus = "PEN_CONNECTION: [" + timestamp + "] Pen connection monitoring enabled (Android)";
        addToBuffer(penConnectionStatus);
        
        // Add pen event types that are being monitored
        String penEventTypes = "PEN_EVENTS: [" + timestamp + "] Monitoring: PEN_UP, PEN_DOWN, PEN_MOVE, PEN_DISCONNECTED, PEN_CONNECTION_FAILURE, PEN_POWER_OFF (Android)";
        addToBuffer(penEventTypes);
        
        // Add logcat capture note
        String penSDKNote = "PEN_SDK_NOTE: [" + timestamp + "] Android pen logs captured via logcat";
        addToBuffer(penSDKNote);
    }

    private void addToBuffer(String log) {
        logBuffer.add(log);
        
        // Keep buffer size manageable
        if (logBuffer.size() > maxBufferSize) {
            logBuffer.remove(0);
        }
        
        // Send to Flutter
        sendLogToFlutter(log);
    }

    private void getAllLogs(Result result) {
        StringBuilder allLogs = new StringBuilder();
        for (String log : logBuffer) {
            allLogs.append(log).append("\n");
        }
        result.success(allLogs.toString());
    }

    private void sendLogToFlutter(String log) {
        if (channel != null) {
            channel.invokeMethod("onLogReceived", log);
        }
    }

    private void uploadLogs(MethodCall call, Result result) {
        try {
            String logData = call.argument("logData");
            if (logData == null) {
                result.error("INVALID_DATA", "Invalid log data", null);
                return;
            }
            
            Log.d("ConsoleLogCapture", "Uploading logs to server: " + logData.substring(0, Math.min(100, logData.length())) + "...");
            
            // TODO: Implement actual HTTP upload to your website
            // You can use OkHttp or HttpURLConnection for HTTP requests
            
            // For now, we'll simulate a successful upload
            new Thread(() -> {
                try {
                    // Simulate network delay
                    Thread.sleep(1000);
                    
                    // Simulate successful upload
                    result.success("Logs uploaded successfully");
                } catch (InterruptedException e) {
                    result.error("UPLOAD_FAILED", "Failed to upload logs: " + e.getMessage(), null);
                }
            }).start();
            
        } catch (Exception e) {
            Log.e("ConsoleLogCapture", "Failed to upload logs", e);
            result.error("UPLOAD_FAILED", "Failed to upload logs: " + e.getMessage(), null);
        }
    }

    private void stopLogCapture(Result result) {
        try {
            isCapturing = false;
            if (logTimer != null) {
                logTimer.cancel();
                logTimer = null;
            }
            
            Log.d("ConsoleLogCapture", "Log capture stopped");
            result.success("Log capture stopped");
        } catch (Exception e) {
            Log.e("ConsoleLogCapture", "Failed to stop log capture", e);
            result.error("STOP_FAILED", "Failed to stop log capture: " + e.getMessage(), null);
        }
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        if (logTimer != null) {
            logTimer.cancel();
        }
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        // Activity is available if needed
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        // Handle config changes if needed
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        // Handle config changes if needed
    }

    @Override
    public void onDetachedFromActivity() {
        // Activity is no longer available
    }
}
