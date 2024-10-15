import 'package:e_commerce/dio/allRepoDataModel.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/debug.dart';
import 'package:e_commerce/utils/preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {


  TextEditingController userNameController = TextEditingController(text: "mor_2314");
  TextEditingController passwordController = TextEditingController(text: "83r5^_");

  var allRepoDataModel = AllRepoDataModel();
  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await allRepoDataModel.loginCall(Get.context!,username, password);
      if(response != null){
        String token = response["token"];
        if(token != ""){
          await Preference.shared.setString(Preference.accessToken, token);
          Get.offAllNamed(AppRoutes.navBarScreen);
        }
      }
      Debug.printLog(response.toString());
    } catch (e) {
      Debug.printLog("Login error: $e");
    } finally {
      isLoading.value = false;  // Set loading to false
    }
  }

}