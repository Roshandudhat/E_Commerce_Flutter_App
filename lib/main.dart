import 'package:e_commerce/routes/app_pages.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'E-Commerce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        locale: Get.deviceLocale,
        getPages: AppPages.list,
        initialRoute:AppRoutes.splashScreen

    );
  }
}

