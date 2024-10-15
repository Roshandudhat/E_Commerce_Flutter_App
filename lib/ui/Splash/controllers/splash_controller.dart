import 'dart:async';

import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/debug.dart';
import 'package:e_commerce/utils/preference.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Debug.printLog("Navigate to Login Screen");
      String token = Preference.shared.getString(Preference.accessToken) ?? "";
      if(token != ""){
        Get.offAllNamed(AppRoutes.navBarScreen);
      }else{
        Get.offAllNamed(AppRoutes.loginScreen);
      }
    });
  }
}
