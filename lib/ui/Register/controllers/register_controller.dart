import 'package:e_commerce/dio/allRepoDataModel.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/debug.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final formKey = GlobalKey<FormState>();


  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  var allRepoDataModel = AllRepoDataModel();
  var isLoading = false.obs;

  Future<void> register(String username, String password,String email,String fullName) async {

    Map<String, dynamic> userData = {
      'email': email,
      'username': username,
      'password': password,
      'name': {
        'firstname': fullName,
        'lastname': " ",
      },
      'address': {
        'city': 'surat',
        'street': 'surat',
        'number': 3,
        'zipcode': '395010',
        'geolocation': {
          'lat': '21.1946',
          'long': '72.8692',
        }
      },
      'phone': '9103669856',
    };

    isLoading.value = true;  // Set loading to true
    try {
      Map<String, dynamic> response = await allRepoDataModel.registionCall(Get.context!,userData);
      if(response != null){
        try{
          int id = response["id"];
          Debug.printLog(id.toString());
          Get.offAllNamed(AppRoutes.loginScreen);
        }catch(e){
          Debug.printLog(e.toString());
        }
      }
    } catch (e) {
      Debug.printLog("Login error: $e");
    } finally {
      isLoading.value = false;  // Set loading to false
    }
  }
}