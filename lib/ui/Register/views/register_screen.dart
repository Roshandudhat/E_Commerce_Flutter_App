import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/ui/Register/controllers/register_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (logic) {
      return Scaffold(
        backgroundColor: CColor.contentColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: logic.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/logo.png', // Ensure to add your logo image
                        height: Get.height*0.4,
                      ),
                      SizedBox(height: Get.height*0.02),
                      TextField(
                        controller: logic.usernameController,
                        decoration: InputDecoration(
                          labelText: 'UserName',
                          labelStyle:AppFontStyle.styleW400(CColor.black, Get.width*0.043),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.person,color: CColor.black,),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: Get.height*0.01),
                      TextField(
                        controller: logic.fullNameController,
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle:AppFontStyle.styleW400(CColor.black, Get.width*0.043),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)
                          ),
                          prefixIcon: const Icon(Icons.person,color: CColor.black,),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: Get.height*0.01),
                      // Email Text Field
                      TextFormField(
                        controller: logic.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          } else if (!RegExp(Constant.emailPattern).hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
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
                      SizedBox(height: Get.height*0.01),
                      TextField(
                        controller: logic.confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
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
                          if (logic.formKey.currentState!.validate()) {
                            logic.register(
                                logic.usernameController.text, logic.passwordController.text,
                                logic.emailController.text,logic.fullNameController.text
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please Enter a valid Email!')),
                            );
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, Get.width*0.1),
                          backgroundColor: CColor.primaryColor
                        ),
                        child: logic.isLoading.value
                            ? const CircularProgressIndicator() : Text("Registion",style: AppFontStyle.styleW400(CColor.white, Get.width*0.05),),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(AppRoutes.loginScreen);
                        },
                        child: const Text("already Sing up? Sign In"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}