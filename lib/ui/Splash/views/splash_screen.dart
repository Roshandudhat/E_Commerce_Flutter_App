import 'package:e_commerce/ui/Splash/controllers/splash_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.contentColor,
      body: GetBuilder<SplashController>(builder: (logic) {
        return SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.5,
                ),
                SizedBox(height: Get.height * 0.03),
                const Text('E-Commerce App', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),
        );
      }),
    );
  }
}