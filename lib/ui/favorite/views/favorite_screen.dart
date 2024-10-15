import 'package:e_commerce/ui/favorite/controllers/favorite_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(builder: (logic) {
      return Scaffold(
        backgroundColor: CColor.contentColor,
        body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Favorite",
                          style: AppFontStyle.styleW700(CColor.black, Get.width*0.065)
                      ),
                    ],
                  ),
                ),
                if(logic.fProductList.isEmpty)
                  Center(
                    child: Container(
                        margin: EdgeInsets.only(
                          top: Get.height*0.35
                        ),
                        child: Text("No Favorite Product Found",style: AppFontStyle.styleW700(CColor.black, Get.width*0.04),)),
                  ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: logic.fProductList.length,
                    itemBuilder: (context, index) {
                      final cartItems = logic.fProductList[index];
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Container(
                                    height: Get.width * 0.15,
                                    width: Get.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: CColor.contentColor,
                                    ),
                                    // padding: const EdgeInsets.all(20),
                                    child: Image.network(cartItems.image),
                                  ),
                                  SizedBox(width: Get.width * 0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            cartItems.title,
                                            maxLines: 2,
                                            style: AppFontStyle.styleW600(
                                                CColor.black, Get.width * 0.04),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cartItems.category,
                                          style: AppFontStyle.styleW500(
                                              Colors.grey, Get.width * 0.035),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "\$${cartItems.price}",
                                          style: AppFontStyle.styleW500(
                                              CColor.black, Get.width * 0.035),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            right: 35,
                            child: Column(
                              children: [
                                // for remove items
                                IconButton(
                                  onPressed: () {
                                    logic.removeFavorite(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            )),
      );
    });
  }
}