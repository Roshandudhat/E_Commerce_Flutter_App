import 'package:e_commerce/ui/AllProduct/controllers/all_product_controller.dart';
import 'package:e_commerce/ui/AllProduct/views/product_grid.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {

  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductController>(builder: (logic) {
      return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "All Product",
                          style: AppFontStyle.styleW700(
                              CColor.black, Get.width * 0.065)
                      ),
                    ],
                  ),
                ),
                if(logic.isLoading.isTrue)
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: Get.height*0.35
                        ),
                        child: CircularProgressIndicator()),
                  ),
                if(logic.productList.isNotEmpty)
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        left: Get.width*0.01,
                        right: Get.width*0.01,
                        top: Get.height*0.02
                      ),
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                        itemCount: logic.productList.length,
                        itemBuilder: (context, index) {
                          return ProductGrid(
                            product: logic.productList[index],
                          );
                        },
                      ),
                    ),
                  )
              ],
            )),
      );
    });
  }
}