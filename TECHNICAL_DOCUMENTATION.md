# Medikalam - Technical Documentation

## Table of Contents
1. [Architecture Overview](#architecture-overview)
2. [Core Components](#core-components)
3. [State Management](#state-management)
4. [API Layer](#api-layer)
5. [Digital Pen Integration](#digital-pen-integration)
6. [Navigation System](#navigation-system)
7. [UI Components](#ui-components)
8. [Error Handling](#error-handling)
9. [Security Implementation](#security-implementation)
10. [Performance Optimizations](#performance-optimizations)

## Architecture Overview

### Clean Architecture Pattern
The application follows Clean Architecture principles with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────────┐
│                    Presentation Layer                       │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Screens       │  │   Widgets       │  │   Providers  │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                     Domain Layer                            │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   Models        │  │   Repositories  │  │   Use Cases  │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
┌─────────────────────────────────────────────────────────────┐
│                   Infrastructure Layer                      │
│  ┌─────────────────┐  ┌─────────────────┐  ┌──────────────┐ │
│  │   API Services  │  │   Local Storage │  │   External   │ │
│  └─────────────────┘  └─────────────────┘  └──────────────┘ │
└─────────────────────────────────────────────────────────────┘
```

### Dependency Injection Setup

```dart
// lib/src/core/injection/injection.dart
@InjectableInit()
void configureDependencies() => getIt.init();

Future<void> localInjection() async {
  // SharedPreferences setup
  await SharedPreferences.getInstance().then((pref) {
    Helpers.prefs = pref;
    CacheUtils.setPrefs(pref);
  });
  
  // Dio HTTP client configuration
  final dio = Dio(BaseOptions(
    baseUrl: EndPoints.apiBaseUrl, 
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    }
  ));
  
  // Add logging interceptor for debugging
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true, 
    requestBody: true, 
    responseHeader: true,
    responseBody: true,
    error: true,
    compact: true,
  ));
  
  // Add authentication interceptor
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = Helpers.getString(key: Keys.token);
      if (token != null) {
        options.headers["x-access-token"] = token;
      }
      handler.next(options);
    },
    onError: (error, handler) {
      if (error.response?.statusCode == 401) {
        // Handle unauthorized access
        Helpers.deleteString(key: Keys.token);
        // Navigate to login
      }
      handler.next(error);
    },
  ));
  
  Helpers.dio = dio;
  
  // EasyLoading configuration
  EasyLoading.instance
    ..indicatorColor = const Color(0xFF146399)
    ..indicatorWidget = const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF146399)),
      backgroundColor: Color(0xFF18a0fb),
    )
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = Colors.transparent
    ..textColor = AppColors.textPrimary
    ..boxShadow = <BoxShadow>[]
    ..animationStyle = EasyLoadingAnimationStyle.opacity
    ..toastPosition = EasyLoadingToastPosition.bottom;
}
```

## Core Components

### Application Entry Point

```dart
// lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables
  await dotenv.load(fileName: Environment.fileName);

  // Initialize Sentry for production builds
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = dotenv.env['SENTRY_DSN'] ?? '';
        options.tracesSampleRate = 1.0;
        options.environment = 'production';
        options.beforeSend = (event, hint) {
          // Filter sensitive data before sending to Sentry
          if (event.extra.containsKey('password')) {
            event.extra.remove('password');
          }
          return event;
        };
      },
      appRunner: () => _initializeApp(),
    );
  } else {
    _initializeApp();
  }
}

Future<void> _initializeApp() async {
  // Initialize dependencies
  await localInjection();
  configureDependencies();
  injectRouter();

  // Configure system UI
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Request permissions after app initialization
      PermissionHandler.requestAllPermissions(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: List.from(providers),
          child: ToastificationWrapper(
            child: MaterialApp.router(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate
              ],
              supportedLocales: const [Locale('en', 'US')],
              theme: ApplicationTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              routerConfig: router,
              builder: EasyLoading.init(),
            ),
          ),
        );
      },
    );
  }
}
```

## State Management

### Provider Configuration

```dart
// lib/src/providers/provider.dart
final List providers = [
  // Permission management
  ChangeNotifierProvider(create: (context) => getIt<PermissionListenerProvider>()),
  
  // Core features
  ChangeNotifierProvider(create: (_) => getIt<PrescriptionProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<DashboardProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PatientProvider>()),
  
  // Form management
  ChangeNotifierProvider(create: (_) => getIt<FormProvider>()),
  
  // Additional features
  ChangeNotifierProvider(create: (_) => getIt<CareGuideProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<RegistrationProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PenProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AudioProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AppointmentProvider>()),
];
```

### Authentication Provider Implementation

```dart
// lib/src/providers/auth/auth_provider.dart
@injectable
class AuthProvider extends ChangeNotifier {
  final AuthRepo _repo = getIt<AuthRepo>();
  User? _user;
  SubmissionStatus _submissionStatus = SubmissionStatus.initial;

  // Form definitions
  FormGroup form = FormGroup({});
  FormGroup userProfileForm = FormGroup({});
  FormGroup loginForm = FormGroup({});

  // Getters
  User? get user => _user;
  SubmissionStatus get getSubmissionStatus => _submissionStatus;

  AuthProvider() {
    _initForms();
    _initUser();
  }

  void _initForms() {
    // User profile form
    userProfileForm = FormGroup({
      '_id': FormControl<String>(), 
      'fullName': FormControl<String>(),
      'firstName': FormControl<String>(),
      'lastName': FormControl<String>(),
      'mobileNumber': FormControl<int>(),
      'email': FormControl<String>(
        validators: [Validators.email],
      ),
      'displayPicture': FormControl<String>(),
      'type': FormControl<String>(),
      'title': FormControl<String>(),
      'hospital': FormControl<String>(),
    });

    // Registration form
    form = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [Validators.required, Validators.minLength(8)],
      ),
      'confirmPassword': FormControl<String>(
        validators: [
          const MustMatchValidator('password', 'confirmPassword', true)
        ],
      ),
    });

    // Login form
    loginForm = FormGroup({
      'email': FormControl<String>(
        validators: [Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: [Validators.required],
      ),
    });
  }

  void setUser(User newUser) {
    _user = newUser;
    userProfileForm.patchValue({
      '_id': newUser.id,
      'fullName': newUser.fullName,
      'firstName': newUser.firstName,
      'lastName': newUser.lastName,
      'mobileNumber': newUser.mobileNumber,
      'email': newUser.email,
      'displayPicture': newUser.displayPicture,
      'type': newUser.type,
      'title': newUser.title,
      'hospital': newUser.hospital.name,
    });
    notifyListeners();
  }

  void _initUser() {
    final user = Helpers.getString(key: Keys.user);
    if (user != null) {
      try {
        setUser(User.fromJson(jsonDecode(user)));
      } catch (e) {
        logger.e('Error parsing user data: $e');
        Helpers.deleteString(key: Keys.user);
      }
    }
  }

  Future<void> updateUser() async {
    logger.d('Updating user info');
    try {
      setSubmissionStatus(SubmissionStatus.submitting);
      
      final updateUser = User(
        id: userProfileForm.value['_id'] as String? ?? '',
        fullName: userProfileForm.value['fullName'] as String? ?? '',
        firstName: userProfileForm.value['firstName'] as String? ?? '',
        lastName: userProfileForm.value['lastName'] as String? ?? '',
        mobileNumber: userProfileForm.value['mobileNumber'] as int? ?? 0,
        email: userProfileForm.value['email'] as String? ?? '',
        displayPicture: userProfileForm.value['displayPicture'] as String? ?? '',
        type: userProfileForm.value['type'] as String? ?? '',
        title: userProfileForm.value['title'] as String? ?? '',
        hospital: Hospital(
          name: userProfileForm.value['hospital'] as String? ?? '',
        ),
      );
      
      final data = await _repo.update(updateUser);
      data.when(
        success: (success) {
          setSubmissionStatus(SubmissionStatus.success);
          Helpers.setString(key: Keys.user, value: jsonEncode(success.toJson()));
          setUser(success);
          showSuccess('Profile updated successfully');
        },
        failure: (failure) {
          setSubmissionStatus(SubmissionStatus.error);
          showError(failure.toString());
        },
      );
    } catch (e, s) {
      setSubmissionStatus(SubmissionStatus.error);
      logger.e('Error updating user: $e', stackTrace: s);
      showError('Failed to update profile');
    }
  }

  Future<void> staffLogin(BuildContext context) async {
    try {
      setSubmissionStatus(SubmissionStatus.submitting);
      
      final data = await _repo.login(
        email: loginForm.value['email'] as String,
        password: loginForm.value['password'] as String,
      );
      
      setSubmissionStatus(SubmissionStatus.success);
      
      data.when(
        success: (success) {
          // Store authentication data
          Helpers.setString(key: Keys.token, value: success.jwt);
          Helpers.setToken(success.jwt);
          Helpers.setString(key: Keys.user, value: jsonEncode(success.user.toJson()));
          setUser(success.user);
          
          showSuccess('Logged in successfully');
          GoRouter.of(context).goNamed(AppScreens.dashboard.name);
        },
        failure: (failure) {
          showError(failure.toString());
        },
      );
    } catch (e, s) {
      setSubmissionStatus(SubmissionStatus.error);
      logger.e('Login error: $e', stackTrace: s);
      showError('Login failed. Please try again.');
    }
  }

  void logout(BuildContext context) {
    // Clear stored data
    Helpers.deleteString(key: Keys.token);
    Helpers.deleteString(key: Keys.user);
    _user = null;
    
    // Navigate to login
    GoRouter.of(context).goNamed(AppScreens.login.name);
  }
}
```

## API Layer

### Repository Pattern Implementation

```dart
// lib/services/api/global/base_repository.dart
abstract class BaseRepository {
  final Dio _dio = Helpers.dio;

  Future<ApiResult<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(response.data);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(Failure(e.toString()));
    }
  }

  Future<ApiResult<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(response.data);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(Failure(e.toString()));
    }
  }

  Future<ApiResult<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(response.data);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(Failure(e.toString()));
    }
  }

  Future<ApiResult<T>> delete<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        options: options,
      );
      return ApiResult.success(response.data);
    } on DioException catch (e) {
      return _handleDioError(e);
    } catch (e) {
      return ApiResult.failure(Failure(e.toString()));
    }
  }

  ApiResult<T> _handleDioError<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiResult.failure(Failure('Connection timeout'));
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data?['message'] ?? 'Server error';
        return ApiResult.failure(Failure('$statusCode: $message'));
      case DioExceptionType.cancel:
        return ApiResult.failure(Failure('Request cancelled'));
      default:
        return ApiResult.failure(Failure('Network error'));
    }
  }
}
```

### Auth Repository Implementation

```dart
// lib/services/api/auth/auth_repo_impl.dart
@Injectable(as: AuthRepo)
class AuthRepoImpl extends BaseRepository implements AuthRepo {
  @override
  Future<ApiResult<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final result = await post<Map<String, dynamic>>(
      EndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return result.when(
      success: (data) => ApiResult.success(LoginResponse.fromJson(data)),
      failure: (failure) => ApiResult.failure(failure),
    );
  }

  @override
  Future<ApiResult<User>> update(User user) async {
    final result = await put<Map<String, dynamic>>(
      '${EndPoints.updateUser}/${user.id}',
      data: user.toJson(),
    );

    return result.when(
      success: (data) => ApiResult.success(User.fromJson(data)),
      failure: (failure) => ApiResult.failure(failure),
    );
  }

  @override
  Future<ApiResult<void>> logout() async {
    final result = await post<void>(EndPoints.logout);
    return result;
  }
}
```

## Digital Pen Integration

### Pen Controller Implementation

```dart
// lib/src/core/pendriver/afpen.dart
class DPenCtrl {
  static const MethodChannel _channel =
      MethodChannel('com.afpensdk.pen.dpenctrl');

  static const EventChannel eventChannel =
      EventChannel('com.afpensdk.pen.dpenctrl/penMsgStream');

  static const EventChannel eventChannelDot =
      EventChannel('com.afpensdk.pen.dpenctrl/penDotStream');

  /// Start Bluetooth scanning for peripherals
  static Future<int> btStartForPeripheralsList() async {
    try {
      final int result =
          await _channel.invokeMethod('btStartForPeripheralsList');
      return result;
    } on PlatformException catch (e) {
      logger.e("Failed to start peripherals list: ${e.message}");
      return -1;
    }
  }

  /// Set application context for pen SDK
  static Future<void> setContext() async {
    try {
      await _channel.invokeMethod('setContext');
    } on PlatformException catch (e) {
      logger.e("Failed to set context: ${e.message}");
    }
  }

  /// Set event listener for pen events
  static Future<void> setListener() async {
    try {
      await _channel.invokeMethod('setListener');
    } on PlatformException catch (e) {
      logger.e("Failed to set listener: ${e.message}");
    }
  }

  /// Connect to pen device
  static Future<void> connect(String addr) async {
    try {
      await _channel.invokeMethod('connect', {'addr': addr});
    } on PlatformException catch (e) {
      logger.e("Failed to connect to pen: ${e.message}");
      throw Exception('Failed to connect to pen: ${e.message}');
    }
  }

  /// Disconnect from pen device
  static Future<void> disconnect() async {
    try {
      await _channel.invokeMethod('disconnect');
    } on PlatformException catch (e) {
      logger.e("Failed to disconnect pen: ${e.message}");
    }
  }

  /// Get pen battery level
  static Future<int> getBatteryLevel() async {
    try {
      final int result = await _channel.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      logger.e("Failed to get battery level: ${e.message}");
      return -1;
    }
  }

  /// Get pen memory usage
  static Future<Map<String, dynamic>> getMemoryUsage() async {
    try {
      final Map<String, dynamic> result = 
          await _channel.invokeMethod('getMemoryUsage');
      return result;
    } on PlatformException catch (e) {
      logger.e("Failed to get memory usage: ${e.message}");
      return {};
    }
  }
}
```

### Pen Provider with State Management

```dart
// lib/src/providers/pen/pen_provider.dart
@injectable
class PenProvider extends ChangeNotifier {
  final List<PenEvent> _penList = [];
  bool _showSvg = false;
  ConnectedPen? _connectedPen;
  bool _isScanning = false;

  // Getters
  ConnectedPen? get connectedPen => _connectedPen;
  bool get isConnected => _connectedPen != null;
  List<PenEvent> get penList => _penList;
  bool get showSvg => _showSvg;
  bool get isScanning => _isScanning;

  // Stream controllers
  final StreamController<String?> _penEventStreamController =
      StreamController<String?>.broadcast();
  Stream<String?> get penEventStream => _penEventStreamController.stream;

  final StreamController<PenDotData> _penDotStreamController =
      StreamController<PenDotData>.broadcast();
  Stream<PenDotData> get penDotStream => _penDotStreamController.stream;

  @override
  void dispose() {
    _penEventStreamController.close();
    _penDotStreamController.close();
    super.dispose();
  }

  void setShowSvg(bool value) {
    _showSvg = value;
    notifyListeners();
  }

  void setScanning(bool scanning) {
    _isScanning = scanning;
    notifyListeners();
  }

  void setConnectedPen(PenEvent penEvent) {
    _connectedPen = ConnectedPen(
      macAddress: penEvent.macAddress,
      deviceName: penEvent.deviceName,
      connectedAt: DateTime.now(),
    );
    notifyListeners();
  }

  void addPenEvent(PenEvent penEvent) {
    if (!_penList.any((e) => e.macAddress == penEvent.macAddress)) {
      _penList.add(penEvent);
      
      // Auto-connect if this pen was previously connected
      if (_connectedPen == null &&
          Helpers.getString(key: Keys.connectedPenMac) == penEvent.macAddress) {
        connect(penEvent.macAddress);
      }
      notifyListeners();
    }
  }

  void deletePen(String macAddress) {
    _penList.removeWhere((element) => element.macAddress == macAddress);
    notifyListeners();
    
    // Remove from stored preferences if it was the connected pen
    if (Helpers.getString(key: Keys.connectedPenMac) == macAddress) {
      Helpers.deleteString(key: Keys.connectedPenMac);
    }
  }

  void penDisconnected() {
    _penList.removeWhere(
        (element) => element.macAddress == _connectedPen?.macAddress);
    _connectedPen = null;
    setShowSvg(false);
    showSuccess("Pen Disconnected");
    notifyListeners();
  }

  void clearList() {
    _penList.clear();
    notifyListeners();
  }

  Future<void> startScanning() async {
    setScanning(true);
    clearList();
    
    try {
      final result = await DPenCtrl.btStartForPeripheralsList();
      if (result != 0) {
        showError("Failed to start pen scanning");
      }
    } catch (e) {
      logger.e("Error starting pen scan: $e");
      showError("Failed to start pen scanning");
    } finally {
      setScanning(false);
    }
  }

  Future<void> connect(String macAddress) async {
    try {
      setConnectedPen(PenEvent(
          macAddress: macAddress, 
          deviceName: '', 
          rssi: 0, 
          penMsgType: 0
      ));
      
      _penEventStreamController.add(macAddress);
      showSuccess("Connected to Pen $macAddress");
      
      await DPenCtrl.connect(macAddress);
      Helpers.setString(key: Keys.connectedPenMac, value: macAddress);
      
      // Start listening for pen data
      _startPenDataListener();
      
    } catch (e) {
      logger.e("Error connecting to pen: $e");
      showError("Failed to connect to pen");
      penDisconnected();
    }
  }

  Future<void> disconnectPen() async {
    try {
      await DPenCtrl.disconnect();
      penDisconnected();
      _penEventStreamController.add(null);
    } catch (e) {
      logger.e("Error disconnecting pen: $e");
      showError("Failed to disconnect pen");
    }
  }

  void _startPenDataListener() {
    // Listen for pen dot data
    DPenCtrl.eventChannelDot.receiveBroadcastStream().listen(
      (data) {
        if (data is Map<String, dynamic>) {
          final penDotData = PenDotData.fromJson(data);
          _penDotStreamController.add(penDotData);
        }
      },
      onError: (error) {
        logger.e("Pen dot stream error: $error");
      },
    );

    // Listen for pen messages
    DPenCtrl.eventChannel.receiveBroadcastStream().listen(
      (data) {
        if (data is Map<String, dynamic>) {
          final penEvent = PenEvent.fromJson(data);
          addPenEvent(penEvent);
        }
      },
      onError: (error) {
        logger.e("Pen message stream error: $error");
      },
    );
  }
}
```

## Navigation System

### Route Configuration

```dart
// lib/services/routing/utils/router_list.dart
final List<GoRoute> routerList = [
  // Splash screen
  GoRoute(
    path: AppScreens.splash.path,
    name: AppScreens.splash.name,
    builder: (context, state) => const SplashScreen(),
  ),
  
  // Landing screen
  GoRoute(
    path: AppScreens.landing.path,
    name: AppScreens.landing.name,
    builder: (context, state) => const LandingScreen(),
  ),
  
  // Authentication routes
  GoRoute(
    path: AppScreens.login.path,
    name: AppScreens.login.name,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: AppScreens.resetPassword.path,
    name: AppScreens.resetPassword.name,
    pageBuilder: (context, state) => _createPage(const ResetPasswordScreen()),
  ),
  GoRoute(
    path: AppScreens.newPassword.path,
    name: AppScreens.newPassword.name,
    pageBuilder: (context, state) => _createPage(const NewPasswordScreen()),
  ),
  
  // Main app routes
  GoRoute(
    path: AppScreens.dashboard.path,
    name: AppScreens.dashboard.name,
    pageBuilder: (context, state) => _createPage(const DashboardScreen()),
  ),
  GoRoute(
    path: AppScreens.patientLanding.path,
    name: AppScreens.patientLanding.name,
    pageBuilder: (context, state) {
      final extra = state.extra as Map<String, dynamic>;
      return _createPage(
        PatientLandingPage(
          operationMode: extra['operationMode'] ?? OperationMode.render,
          showBottomSheet: extra['showBottomSheet'] ?? false,
        ),
      );
    },
  ),
  
  // Patient management routes
  GoRoute(
    path: AppScreens.addPatient.path,
    name: AppScreens.addPatient.name,
    pageBuilder: (context, state) => _createPage(const AddPatientPage()),
  ),
  GoRoute(
    path: AppScreens.caseDetail.path,
    name: AppScreens.caseDetail.name,
    pageBuilder: (context, state) =>
        _createPage(CaseDetails(caseId: state.extra as String)),
  ),
  GoRoute(
    path: AppScreens.patientDetail.path,
    name: AppScreens.patientDetail.name,
    pageBuilder: (context, state) =>
        _createPage(PatientDetailsPage(pData: state.extra as PatientResponse)),
  ),
  
  // Prescription routes
  GoRoute(
    path: AppScreens.prescriptionPaper.path,
    name: AppScreens.prescriptionPaper.name,
    pageBuilder: (context, state) => _createPage(const PrescriptionPaper()),
  ),
  
  // Utility routes
  GoRoute(
    path: AppScreens.qrScanner.path,
    name: AppScreens.qrScanner.name,
    pageBuilder: (context, state) => _createPage(const QrScanner()),
  ),
  
  // Profile routes
  GoRoute(
    path: AppScreens.profile.path,
    name: AppScreens.profile.name,
    pageBuilder: (context, state) => _createPage(const ProfilePage()),
  ),
  GoRoute(
    path: AppScreens.editProfile.path,
    name: AppScreens.editProfile.name,
    pageBuilder: (context, state) => _createPage(const EditProfile()),
  ),
];

// Custom page transition
CustomTransitionPage _createPage(Widget child) {
  return CustomTransitionPage(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
```

### Screen Name Extensions

```dart
// lib/services/routing/utils/extensions/screen_name_extension.dart
enum AppScreens {
  splash('/splash'),
  landing('/landing'),
  login('/login'),
  resetPassword('/reset-password'),
  newPassword('/new-password'),
  dashboard('/dashboard'),
  patientLanding('/patient-landing'),
  addPatient('/add-patient'),
  caseDetail('/case-detail'),
  patientDetail('/patient-detail'),
  prescriptionPaper('/prescription-paper'),
  qrScanner('/qr-scanner'),
  profile('/profile'),
  editProfile('/edit-profile'),
  careGuides('/care-guides'),
  registerVisit('/register-visit'),
  bookAppointment('/book-appointment'),
  addDocuments('/add-documents'),
  report('/report');

  const AppScreens(this.path);
  final String path;

  String get name => toString().split('.').last;
}
```

## UI Components

### Custom Shimmer Handler

```dart
// lib/src/views/widgets/wrapper/shimmer_handler.dart
class ShimmerHandler extends StatelessWidget {
  final Status status;
  final Widget shimmer;
  final Widget onSuccess;
  final Widget? onError;
  final Widget? onEmpty;
  final VoidCallback? onRetry;

  const ShimmerHandler({
    super.key,
    required this.status,
    required this.shimmer,
    required this.onSuccess,
    this.onError,
    this.onEmpty,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.loading:
        return shimmer;
      case Status.success:
        return onSuccess;
      case Status.error:
        return onError ?? ErrorWidget(
          message: 'Something went wrong',
          onRetry: onRetry,
        );
      case Status.empty:
        return onEmpty ?? const EmptyWidget(
          message: 'No data available',
        );
    }
  }
}
```

### Custom Container Widget

```dart
// lib/src/views/widgets/custom_container/custom_container_widget.dart
class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  const CustomContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.all(16),
        margin: margin,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          border: border,
          boxShadow: boxShadow ?? [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
```

### Custom Text Field

```dart
// lib/src/views/widgets/textfield/custom_textfield.dart
class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: context.textTheme.titleSmall?.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          maxLength: maxLength,
          enabled: enabled,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.error),
            ),
            filled: true,
            fillColor: enabled ? Colors.white : AppColors.disabled,
          ),
        ),
      ],
    );
  }
}
```

## Error Handling

### Result Type Implementation

```dart
// lib/src/core/errors/failures.dart
abstract class Failure {
  final String message;
  const Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(String message) : super(message);
}
```

### API Result Type

```dart
// lib/services/api/api_result.dart
sealed class ApiResult<T> {
  const ApiResult();
}

class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends ApiResult<T> {
  final Failure failure;
  const Failure(this.failure);
}

extension ApiResultExtension<T> on ApiResult<T> {
  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;
  
  T? get data => isSuccess ? (this as Success<T>).data : null;
  Failure? get error => isFailure ? (this as Failure<T>).failure : null;
  
  ApiResult<R> map<R>(R Function(T) transform) {
    return when(
      success: (data) => Success(transform(data)),
      failure: (failure) => Failure(failure),
    );
  }
  
  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) failure,
  }) {
    if (this is Success<T>) {
      return success((this as Success<T>).data);
    } else if (this is Failure<T>) {
      return failure((this as Failure<T>).failure);
    }
    throw Exception('Unknown ApiResult type');
  }
}
```

## Security Implementation

### Token Management

```dart
// lib/src/core/utils/helpers/helpers.dart
class Helpers {
  static late SharedPreferences prefs;
  static late Dio dio;

  // Token management
  static void setToken(String token) {
    dio.options.headers["x-access-token"] = token;
  }

  static void removeToken() {
    dio.options.headers.remove("x-access-token");
  }

  // Secure storage methods
  static Future<void> setString({required String key, required String value}) async {
    await prefs.setString(key, value);
  }

  static String? getString({required String key}) {
    return prefs.getString(key);
  }

  static Future<void> deleteString({required String key}) async {
    await prefs.remove(key);
  }

  // Validation methods
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  static bool isValidPhone(String phone) {
    return RegExp(r'^\+?[\d\s-]+$').hasMatch(phone);
  }

  // Encryption/Decryption (if needed)
  static String encryptData(String data) {
    // Implement encryption logic
    return data;
  }

  static String decryptData(String encryptedData) {
    // Implement decryption logic
    return encryptedData;
  }
}
```

### Permission Handler

```dart
// lib/src/core/utils/helpers/permission_helper.dart
class PermissionHandler {
  static Future<void> requestAllPermissions(BuildContext context) async {
    final permissions = [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.location,
      Permission.camera,
      Permission.microphone,
      Permission.storage,
    ];

    for (final permission in permissions) {
      final status = await permission.status;
      if (status.isDenied) {
        final result = await permission.request();
        if (result.isDenied) {
          showPermissionDialog(context, permission);
        }
      }
    }
  }

  static void showPermissionDialog(BuildContext context, Permission permission) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permission Required'),
        content: Text(
          'This app needs ${permission.toString().split('.').last} permission to function properly.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Settings'),
          ),
        ],
      ),
    );
  }
}
```

## Performance Optimizations

### Image Caching Service

```dart
// lib/src/core/injection/image_service.dart
@injectable
class ImageService {
  final Map<String, ui.Image> _imageCache = {};

  Future<void> preloadImage(String imageUrl) async {
    if (_imageCache.containsKey(imageUrl)) return;

    try {
      final networkImage = NetworkImage(imageUrl);
      final imageStream = networkImage.resolve(const ImageConfiguration());
      
      final completer = Completer<ui.Image>();
      final listener = ImageStreamListener((info, _) {
        completer.complete(info.image);
      });
      
      imageStream.addListener(listener);
      final image = await completer.future;
      _imageCache[imageUrl] = image;
    } catch (e) {
      logger.e('Failed to preload image: $e');
    }
  }

  ui.Image? getCachedImage(String imageUrl) {
    return _imageCache[imageUrl];
  }

  void clearCache() {
    _imageCache.clear();
  }
}
```

### Lazy Loading Implementation

```dart
// lib/src/views/mixins/paginated_searchable_mixin.dart
mixin PaginatedSearchableMixin<T> on StatefulWidget {
  final List<T> _items = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;
  String _searchQuery = '';
  Timer? _searchDebounce;

  List<T> get items => _items;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setHasMore(bool hasMore) {
    _hasMore = hasMore;
    notifyListeners();
  }

  void addItems(List<T> newItems) {
    _items.addAll(newItems);
    notifyListeners();
  }

  void clearItems() {
    _items.clear();
    _currentPage = 1;
    _hasMore = true;
    notifyListeners();
  }

  void onSearch(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      _searchQuery = query;
      clearItems();
      loadData();
    });
  }

  void loadMore() {
    if (!_isLoading && _hasMore) {
      _currentPage++;
      loadData();
    }
  }

  Future<void> loadData();
  void notifyListeners();

  @override
  void dispose() {
    _searchDebounce?.cancel();
    super.dispose();
  }
}
```

This technical documentation provides a comprehensive overview of the Medikalam Flutter application's architecture, implementation details, and key code snippets. The application demonstrates modern Flutter development practices with clean architecture, proper state management, and robust error handling. 