import 'package:e_commerce/ui/cart/controllers/cart_controller.dart';
import 'package:e_commerce/ui/cart/views/check_out.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (logic) {
      return Scaffold(
        backgroundColor: CColor.contentColor,
        bottomSheet: CheckOutBox(),
        body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "My Cart",
                        style: AppFontStyle.styleW700(CColor.black, Get.width*0.065)
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: logic.cartProductList.length,
                    itemBuilder: (context, index) {
                      final cartItems = logic.cartProductList[index];
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
                                    height: Get.width*0.15,
                                    width: Get.width*0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: CColor.contentColor,
                                    ),
                                    // padding: const EdgeInsets.all(20),
                                    child: Image.network(cartItems.image),
                                  ),
                                  SizedBox(width: Get.width*0.03),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        SizedBox(
                                          width: Get.width*0.4,
                                          child: Text(
                                            cartItems.title,
                                            maxLines: 2,
                                            style: AppFontStyle.styleW600(CColor.black, Get.width*0.04),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          cartItems.category,
                                          style: AppFontStyle.styleW500(Colors.grey, Get.width*0.035),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "\$${cartItems.price}",
                                          style: AppFontStyle.styleW500(CColor.black, Get.width*0.035),
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
                                    logic.removeProductForCart(index);
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                ),
                                // for items quantity
                                const SizedBox(height: 10),
                                Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: CColor.contentColor,
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                      width: 2,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      logic.producrQuantity(Icons.add, index),
                                      const SizedBox(width: 10),
                                      Text(
                                        cartItems.quantity.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      logic.producrQuantity(Icons.remove, index),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                )
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