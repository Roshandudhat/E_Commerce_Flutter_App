import 'package:e_commerce/ui/navbar/controllers/navbar_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarScreen extends StatelessWidget {

  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (logic) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            logic.onChanageIndex(2);
          },
          shape: const CircleBorder(),
          backgroundColor: CColor.primaryColor,
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: Get.width*0.085,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 1,
          height: Get.height*0.085,
          color: CColor.white,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  logic.onChanageIndex(0);
                },
                icon: Icon(
                  Icons.grid_view_outlined,
                  size: Get.width*0.075,
                  color: logic.cuttentIndex == 0 ? CColor.primaryColor : Colors.grey
                      .shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  logic.onChanageIndex(1);
                },
                icon: Icon(
                  Icons.favorite_border,
                  size: Get.width*0.075,
                  color: logic.cuttentIndex == 1 ? CColor.primaryColor : Colors.grey
                      .shade400,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              IconButton(
                onPressed: () {
                  logic.onChanageIndex(3);
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  size: Get.width*0.075,
                  color: logic.cuttentIndex == 3 ? CColor.primaryColor : Colors.grey
                      .shade400,
                ),
              ),
              IconButton(
                onPressed: () {
                  logic.onChanageIndex(4);
                },
                icon: Icon(
                  Icons.person,
                  size: Get.width*0.075,
                  color: logic.cuttentIndex == 4 ? CColor.primaryColor : Colors.grey
                      .shade400,
                ),
              ),
            ],
          ),
        ),
        body: logic.screens[logic.cuttentIndex],
      );
    });
  }
}