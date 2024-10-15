import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/ui/login/controllers/login_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (logic) {
      return Scaffold(
        backgroundColor: CColor.contentColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/logo.png', // Ensure to add your logo image
                      height: Get.height*0.4,
                    ),
                    SizedBox(height: Get.height*0.02),
                    // Email Text Field
                    TextFormField(
                      controller: logic.userNameController,
                      decoration: InputDecoration(
                        labelText: 'UserName',
                        labelStyle:AppFontStyle.styleW400(CColor.black, Get.width*0.043),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: const Icon(Icons.email,color: CColor.black,),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                     SizedBox(height: Get.height*0.01),
                    // Password Text Field
                    TextField(
                      controller: logic.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:AppFontStyle.styleW400(CColor.black, Get.width*0.043),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        prefixIcon: const Icon(Icons.lock,color: CColor.black,),
                      ),
                    ),
                    SizedBox(height: Get.height*0.02),
                    // Login Button
                    ElevatedButton(
                      onPressed: logic.isLoading.value
                          ? null
                          : () {
                          logic.login(
                              logic.userNameController.text, logic.passwordController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, Get.width*0.1),
                        backgroundColor: CColor.primaryColor
                      ),
                      child: logic.isLoading.isTrue
                          ? const CircularProgressIndicator() : Text("Login",style: AppFontStyle.styleW400(CColor.white, Get.width*0.05),),
                    ),
                    const SizedBox(height: 10),
                    // Sign Up Link
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.registionScreen);
                      },
                      child: Text("Don't have an account? Sign Up"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}