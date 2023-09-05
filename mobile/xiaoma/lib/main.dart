// ignore_for_file: public_member_api_docs, sort_constructors_first, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// app pack
import 'package:xiaoma/app/app.dart';
import 'package:xiaoma/auth/auth.dart';
import 'package:xiaoma/dashboard/screens/dashboard_screen.dart';
import 'package:xiaoma/onboarding/onboarding.dart';
// utils
import 'package:xiaoma/utils/utils.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // repos
  final _appStore = locator<AppStores>();

  // functions
  String initialRoute() {
    if (_appStore.isOnBoarded && _appStore.isAuthenticated) {
      return DashboardScreen.routeName;
    }
    if (!_appStore.isOnBoarded) {
      return OnBoardScreen.routeName;
    }
    if (_appStore.isOnBoarded && !_appStore.isAuthenticated) {
      return LoginScreen.routeName;
    }
    return OnBoardScreen.routeName;
  }

  @override
  void initState() {
    _appStore.initializeApp();
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final _routeName = initialRoute();
        return GestureDetector(
          onTap: () {
            final focusScope = FocusScope.of(context);
            if (!focusScope.hasPrimaryFocus) {
              focusScope.unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'XiaoMa',
            theme: appTheme,
            initialRoute: _routeName,
            onGenerateRoute: handleRoutes,
          ),
        );
      },
    );
  }
}
