import 'package:ecommerce_website/app/constants/constants.dart';
import 'package:ecommerce_website/app/modules/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (contextScreen, child) {
          return GetMaterialApp(
            title: 'BEGLER DISTRIBUTION',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              brightness: Brightness.light,
              fontFamily: gilroyMedium,
              colorSchemeSeed: kPrimaryColor,
              useMaterial3: false,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                systemOverlayStyle: const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.white),
                titleTextStyle: TextStyle(color: Colors.black, fontFamily: gilroySemiBold, fontSize: 20.sp),
                elevation: 0,
              ),
              bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent.withOpacity(0)),
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SignUpView(),
          );
        });
  }
}
