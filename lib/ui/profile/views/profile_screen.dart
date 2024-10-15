import 'package:e_commerce/ui/profile/controllers/profile_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return GetBuilder<ProfileController>(builder: (logic) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                height: size.height * 0.4,
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  const CircleAvatar(
                                    radius: 42,
                                    backgroundColor: Colors.grey,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                        Color.fromARGB(255, 95, 225, 99),
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "mor_2314",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 35,
                            ),
                          ),
                          const Text(
                            "E-Commerce",
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.black45),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Shop seamlessly online with diverse products and easy checkout options",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: Get.height * 0.04
                            ),
                            child: Row(
                              children: [
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    logic.logOut();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * 0.01,
                                        horizontal: Get.width * 0.04
                                    ),
                                    decoration: BoxDecoration(
                                        color: CColor.primaryColor,
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Text("Log out",
                                      style: AppFontStyle.styleW400(
                                          CColor.white, Get.width * 0.05),),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
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