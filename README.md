# Medikalam - Flutter Medical Application

## Overview

Medikalam is a comprehensive Flutter-based medical application designed for healthcare professionals to manage patients, appointments, prescriptions, and digital pen integration. The application follows a clean architecture pattern with dependency injection, state management using Provider, and modern Flutter development practices.

## 🏗️ Architecture

### Project Structure
```
lib/
├── main.dart                          # Application entry point
├── services/                          # API and routing services
│   ├── api/                          # Repository implementations
│   └── routing/                      # Navigation and routing
├── src/
│   ├── core/                         # Core utilities and configurations
│   │   ├── injection/                # Dependency injection setup
│   │   ├── pendriver/                # Digital pen integration
│   │   ├── theme/                    # App theming
│   │   └── utils/                    # Constants and helpers
│   ├── models/                       # Data models
│   ├── providers/                    # State management
│   └── views/                        # UI components
│       ├── screens/                  # Application screens
│       └── widgets/                  # Reusable widgets
```

### Key Technologies & Dependencies

```yaml
# Core Dependencies
flutter: sdk: flutter
provider: ^6.1.2                    # State management
go_router: ^14.1.3                  # Navigation
get_it: ^7.7.0                      # Dependency injection
injectable: ^2.4.4                  # Code generation for DI
dio: ^5.6.0                         # HTTP client
freezed_annotation: ^2.4.1          # Immutable data classes
flutter_blue_plus: ^1.35.3          # Bluetooth connectivity
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK >=3.4.0
- Dart SDK >=3.4.0
- Android Studio / VS Code
- iOS development tools (for iOS builds)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd medikalam
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Setup environment variables**
Create `.env.development` and `.env.production` files in the root directory:
```env
API_BASE_URL=your_api_base_url
SENTRY_DSN=your_sentry_dsn
```

4. **Run the application**
```bash
flutter run
```

## 📱 Key Features

### 1. Authentication System
- Secure login with email/password
- JWT token management
- User profile management

### 2. Patient Management
- Add new patients
- View patient details
- Search and filter patients
- Case management

### 3. Digital Pen Integration
- Bluetooth pen connectivity
- Real-time pen data processing
- Prescription writing with digital pen

### 4. Appointment Management
- Book appointments
- View today's appointments
- Calendar integration

### 5. Prescription Management
- Digital prescription creation
- QR code generation
- PDF generation and sharing

## 🔧 Core Components

### 1. Application Entry Point

```dart
// lib/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'your_sentry_dsn';
        options.tracesSampleRate = 1.0;
        options.environment = 'production';
      },
      appRunner: () => _initializeApp(),
    );
  } else {
    _initializeApp();
  }
}
```

### 2. Dependency Injection Setup

```dart
// lib/src/core/injection/injection.dart
final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => getIt.init();

Future<void> localInjection() async {
  await SharedPreferences.getInstance().then((pref) {
    Helpers.prefs = pref;
    CacheUtils.setPrefs(pref);
  });
  
  final dio = Dio(BaseOptions(
    baseUrl: EndPoints.apiBaseUrl, 
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10)
  ));
  
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true, 
    requestBody: true, 
    responseHeader: true
  ));
  
  final token = Helpers.getString(key: "token");
  if (token != null) {
    dio.options.headers["x-access-token"] = token;
  }
  
  Helpers.dio = dio;
}
```

### 3. State Management with Provider

```dart
// lib/src/providers/provider.dart
final List providers = [
  ChangeNotifierProvider(create: (context) => getIt<PermissionListenerProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PrescriptionProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AuthProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<DashboardProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PatientProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<FormProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<CareGuideProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<RegistrationProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<PenProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AudioProvider>()),
  ChangeNotifierProvider(create: (_) => getIt<AppointmentProvider>()),
];
```

### 4. Authentication Provider

```dart
// lib/src/providers/auth/auth_provider.dart
@injectable
class AuthProvider extends ChangeNotifier {
  final AuthRepo _repo = getIt<AuthRepo>();
  User? _user;
  
  FormGroup loginForm = FormGroup({
    'email': FormControl<String>(
      validators: [Validators.required, Validators.email],
    ),
    'password': FormControl<String>(
      validators: [Validators.required],
    ),
  });

  Future<void> staffLogin(BuildContext context) async {
    try {
      setSubmissionStatus(SubmissionStatus.submitting);
      final data = await _repo.login(
        email: loginForm.value['email'] as String,
        password: loginForm.value['password'] as String,
      );
      
      data.when(
        success: (success) {
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
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
```

### 5. Digital Pen Integration

```dart
// lib/src/core/pendriver/afpen.dart
class DPenCtrl {
  static const MethodChannel _channel =
      MethodChannel('com.afpensdk.pen.dpenctrl');

  static const EventChannel eventChannel =
      EventChannel('com.afpensdk.pen.dpenctrl/penMsgStream');

  static Future<int> btStartForPeripheralsList() async {
    try {
      final int result =
          await _channel.invokeMethod('btStartForPeripheralsList');
      return result;
    } on PlatformException catch (e) {
      debugPrint("Failed to start peripherals list: ${e.message}");
      return -1;
    }
  }

  static Future<void> connect(String addr) async {
    try {
      await _channel.invokeMethod('connect', {'addr': addr});
    } on PlatformException catch (e) {
      debugPrint("${e.message}");
    }
  }
}
```

### 6. Pen Provider for State Management

```dart
// lib/src/providers/pen/pen_provider.dart
@injectable
class PenProvider extends ChangeNotifier {
  final List<PenEvent> _penList = [];
  ConnectedPen? _connectedPen;
  
  bool get isConnected => _connectedPen != null;
  List<PenEvent> get penList => _penList;

  Future<void> connect(String macAddress) async {
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
  }

  void penDisconnected() {
    _penList.removeWhere(
        (element) => element.macAddress == _connectedPen?.macAddress);
    _connectedPen = null;
    setShowSvg(false);
    showSuccess("Pen Disconnected");
    notifyListeners();
  }
}
```

### 7. Dashboard Screen

```dart
// lib/src/views/screens/dashboard/dashboard_screen.dart
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with PenConnectionMixin<DashboardScreen> {
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
      context.read<PermissionListenerProvider>();
      context.read<PrescriptionProvider>().getPageConfig();
      context.read<PrescriptionProvider>().addSymbols();
      
      final penProvider = context.read<PenProvider>();
      penProvider.penEventStream.listen((event) {
        if (event != null) {
          startListener();
          startBle();
        } else {
          penProvider.penDisconnected();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: SafeArea(
          child: PageStorage(
            bucket: _bucket,
            child: Constants.pages[context.read<DashboardProvider>().navIndex]
          ),
        ),
        floatingActionButton: provider.navIndex == 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Consumer<PenProvider>(builder: (context, provider, child) {
                    return ShimmerHandler(
                      status: Provider.of<DashboardProvider>(context).status,
                      shimmer: headerShimmer(),
                      onSuccess: appointHeader(
                        theme: context.textTheme,
                        title: '',
                        title1: "",
                        icon: provider.isConnected
                            ? 'assets/icons/c1.svg'
                            : 'assets/icons/c2.svg',
                        ontap: () async {
                          final isConnected = provider.isConnected;
                          if (isConnected) {
                            context.read<PrescriptionProvider>().isScan = false;
                            context.push(AppScreens.prescriptionPaper.path);
                          } else {
                            await penConnectionBottomSheet(context: context);
                          }
                        },
                      ),
                    );
                  }),
                ],
              )
            : null,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFEFEFEF),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            selectedItemColor: AppColors.navText,
            unselectedItemColor: AppColors.white,
            currentIndex: provider.navIndex,
            onTap: provider.updateIndex,
            items: List.generate(
              4,
              (index) => BottomNavigationBarItem(
                backgroundColor: AppColors.white,
                icon: SvgPicture.asset(
                  Constants.icons[index],
                  colorFilter: ColorFilter.mode(
                    provider.navIndex == index
                        ? Colors.blue
                        : AppColors.txtLabel,
                    BlendMode.srcIn,
                  ),
                ),
                label: Constants.iconText[index],
              ),
            ),
          ),
        ),
      );
    });
  }
}
```

### 8. Data Models

```dart
// lib/src/models/patient/patient.dart
@freezed
class PatientResponse extends Identifiable with _$PatientResponse {
  const factory PatientResponse({
    @JsonKey(name: '_id') required String id,
    required int mobileNumber,
    required String fullName,
    required String gender,
    required int updatedAt,
    @JsonKey(defaultValue: 0) required int age,
    required int createdAt,
    required String hospitalId,
    required String creatorId,
    required String searchIndex,
    @JsonKey(name: '__v') required int v,
  }) = _PatientResponse;

  factory PatientResponse.fromJson(Map<String, dynamic> json) =>
      _$PatientResponseFromJson(json);

  factory PatientResponse.empty() => const PatientResponse(
        id: '',
        mobileNumber: 0,
        fullName: '',
        gender: '',
        updatedAt: 0,
        age: 0,
        createdAt: 0,
        hospitalId: '',
        creatorId: '',
        searchIndex: '',
        v: 0,
      );
}
```

## 🛣️ Navigation

The application uses GoRouter for navigation with a centralized routing system:

```dart
// lib/services/routing/app_router.dart
class AppRouter {
  AppRouter();

  final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: routerList,
    initialLocation: AppScreens.splash.path,
  );
}
```

### Key Routes
- `/splash` - Splash screen
- `/login` - Authentication
- `/dashboard` - Main dashboard
- `/patient-landing` - Patient management
- `/add-patient` - Add new patient
- `/case-detail` - Patient case details
- `/prescription-paper` - Digital prescription
- `/qr-scanner` - QR code scanning

## 🎨 UI/UX Features

### Custom Widgets
- **ShimmerHandler** - Loading states with shimmer effects
- **CustomContainer** - Reusable container components
- **CustomTextField** - Form input components
- **BottomNavigationBar** - Custom navigation with icons

### Theme System
- Consistent color scheme
- Custom typography
- Responsive design with ResponsiveSizer
- Inter font family integration

## 🔐 Security Features

- JWT token authentication
- Secure API communication
- Permission handling
- Environment-based configuration

## 📊 Error Handling & Monitoring

- Sentry integration for crash reporting
- Comprehensive error handling with Result types
- User-friendly error messages
- Loading states and retry mechanisms

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run widget tests
flutter test test/widget_test.dart
```

## 📦 Build & Deployment

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is proprietary software. All rights reserved.

## 🆘 Support

For support and questions, please contact the development team or create an issue in the repository.

---

**Version:** 1.0.2+4  
**Flutter SDK:** >=3.4.0  
**Dart SDK:** >=3.4.0