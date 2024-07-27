import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:marckit/core/config/bindings.dart';
import 'package:marckit/core/constants/theme_service.dart';
import 'package:marckit/fetchars/pages_start/splash_screen.dart';
import 'package:marckit/firebase_options.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  OneSignal.initialize('66570ea2-4b6f-42c5-83b2-b52342d35973');
  OneSignal.Notifications.requestPermission(true);
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const APPMARCKIT());
}

class APPMARCKIT extends StatelessWidget {
  const APPMARCKIT({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 860),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        initialBinding: MyBindings(),
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
