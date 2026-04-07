import 'dart:io';

import 'package:elearning/helper/helper_utils.dart';
import 'package:elearning/services/local_store_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'helper/languages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setupApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: (_, child) => GetMaterialApp(
        textDirection: TextDirection.ltr,
        title: "E-Learning",
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        translations: Languages(),
        locale:  HelperUtils.locateLanguage(),
        fallbackLocale:  HelperUtils.locateLanguage(),

      ),
      designSize: const Size(360, 800),
    );
  }
}

Future<void> _setupApp() async {
  // DependencyInjection.init();
 await HiveService.initHive();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Platform.isIOS
      ? await Firebase.initializeApp()
      : await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey:
                "AAAAMxoQ-kc:APA91bEjyIgjzlmbZh_UBvxN8nbnZNqHc07-VS1_83LUlo327uFt-msccqlJy9JtIFt0wPvjPKx2cUGQhgEvpD15q6DnCrUDJBlaa02inW1KqwHpBz3jqM_bpEgTDnwv4waEd4oPwT8C",
            appId: "1:219480652359:android:f3da2642f4e8277b360f62",
            messagingSenderId: "219480652359",
            projectId: "elearning-b6858",
          ),
        );

}
