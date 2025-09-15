# iOS Periodic Auto-Reconnect Implementation

## Requirement
Implement periodic pen connectivity check every 5 seconds in iOS. When pen disconnects, automatically check if pen is available and reconnect if found. This should only work when user is logged in.

## Implementation Summary

### 1. iOS Native Implementation (AppDelegate.swift)

#### New Properties Added:
```swift
private var reconnectTimer: Timer?
private var isUserLoggedIn = false
private var lastConnectedPenMac: String?
private var lastConnectedPenName: String?
private var isAutoReconnectEnabled = false
```

#### Key Methods:

**`startAutoReconnectTimer()`**
- Starts a 5-second repeating timer
- Only starts if user is logged in and auto-reconnect is enabled
- Automatically stops any existing timer before starting new one

**`checkAndReconnectPen()`**
- Called every 5 seconds by timer
- Checks multiple conditions:
  - User must be logged in
  - Auto-reconnect must be enabled
  - Pen must not be currently connected
  - Must have previously connected pen info
- Starts BLE scan to find available pens
- Attempts reconnection if pen is found

**`attemptAutoReconnect(mac, name)`**
- Attempts to connect to specific pen
- Notifies Flutter about reconnection attempt
- Handles connection result

#### Event Flow:
1. **Pen Connects** → Store pen info, enable auto-reconnect, stop timer
2. **Pen Disconnects** → Start 5-second timer (if user logged in)
3. **Timer Tick** → Check pen availability and attempt reconnect
4. **Successful Reconnect** → Stop timer via connection success event

### 2. Flutter Implementation

#### DPenCtrl Methods Added:
```dart
static Future<bool> setUserLoginStatus(bool isLoggedIn)
static Future<bool> setAutoReconnectEnabled(bool enabled)
```

#### PenProvider Methods Added:
```dart
Future<void> setUserLoginStatus(bool isLoggedIn)
Future<void> setAutoReconnectEnabled(bool enabled)
```

#### Helper Class Created:
`PenAutoReconnectHelper` - Provides easy interface for managing auto-reconnect based on user login status.

### 3. Event Handling Enhanced

#### New Event Type:
```json
{
  "autoReconnectAttempt": true,
  "penMac": "XX:XX:XX:XX:XX:XX",
  "penName": "PenName"
}
```

This event is sent when iOS attempts auto-reconnection, allowing Flutter to track reconnection attempts.

## Usage Instructions

### 1. App Initialization
```dart
import 'package:Medikalam/src/core/utils/helpers/pen_auto_reconnect_helper.dart';

// In your app startup
final penProvider = context.read<PenProvider>();
PenAutoReconnectHelper.initialize(penProvider);
```

### 2. User Login
```dart
// When user successfully logs in
await PenAutoReconnectHelper.onUserLogin();
```

### 3. User Logout
```dart
// When user logs out
await PenAutoReconnectHelper.onUserLogout();
```

### 4. Manual Control (Optional)
```dart
// Enable/disable auto-reconnect manually
await PenAutoReconnectHelper.setAutoReconnectEnabled(true);

// Check if auto-reconnect is available
bool available = PenAutoReconnectHelper.isAutoReconnectAvailable;
```

## Key Features

### ✅ **Login-Based Control**
- Auto-reconnect only works when user is logged in
- Automatically disabled on logout
- Prevents unnecessary reconnection attempts

### ✅ **Smart Timer Management**
- Timer starts only after pen disconnect
- Timer stops when pen successfully reconnects
- Timer stops when user logs out
- No unnecessary scanning when pen is connected

### ✅ **Efficient Scanning**
- Only scans when reconnection is needed
- Uses existing pen discovery mechanism
- Minimal battery impact

### ✅ **State Synchronization**
- Maintains connection state between iOS and Flutter
- Proper cleanup on logout
- Handles edge cases (app backgrounding, etc.)

## Testing Scenarios

### 1. Basic Auto-Reconnect
1. User logs in
2. Connect to pen
3. Turn off pen or move out of range
4. Wait for disconnect event
5. Turn pen back on
6. Verify auto-reconnection within 5-10 seconds

### 2. Login/Logout Behavior
1. Connect pen while logged in
2. Logout → Auto-reconnect should stop
3. Login again → Auto-reconnect should resume
4. Disconnect pen → Should start trying to reconnect

### 3. Multiple Pens
1. Connect to Pen A
2. Disconnect Pen A
3. Turn on Pen B (different pen)
4. Should not auto-connect to Pen B
5. Turn on Pen A → Should auto-connect to Pen A

### 4. App State Changes
1. Connect pen
2. Disconnect pen (auto-reconnect starts)
3. Minimize app
4. Turn pen back on
5. Bring app to foreground
6. Should auto-reconnect

## Debug Information

### iOS Console Logs:
```
Starting auto-reconnect timer (5 seconds interval)
Checking pen availability for auto-reconnect: PenName (XX:XX:XX:XX:XX:XX)
Auto-reconnect scan started with result: 0
Auto-reconnecting to pen: PenName (XX:XX:XX:XX:XX:XX)
Auto-reconnect initiated successfully
Auto-reconnect enabled after successful connection, timer stopped
```

### Flutter Logs:
```
PEN_USER_LOGIN_STATUS: Setting login status to true
PEN_AUTO_RECONNECT: User logged in, auto-reconnect enabled for iOS
PEN_AUTO_RECONNECT_ATTEMPT: Auto-reconnect attempt detected
PEN_AUTO_RECONNECT_INFO: Attempting to reconnect to PenName (XX:XX:XX:XX:XX:XX)
```

## Performance Considerations

- **Timer Frequency**: 5 seconds is optimal balance between responsiveness and battery life
- **Scan Duration**: Quick scan (2 seconds) before attempting connection
- **Resource Management**: Timer is properly disposed when not needed
- **Background Behavior**: iOS may limit background timers, but foreground behavior is guaranteed

## Status: ✅ IMPLEMENTED

The periodic auto-reconnect functionality is now fully implemented for iOS with proper login-based control. The system will automatically attempt to reconnect every 5 seconds when:

1. User is logged in
2. Pen was previously connected
3. Pen is currently disconnected
4. Auto-reconnect is enabled

This provides seamless pen connectivity experience while respecting user authentication state and device power management.
