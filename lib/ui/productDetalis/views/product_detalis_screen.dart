import 'package:e_commerce/ui/productDetalis/controllers/product_detalis_controller.dart';
import 'package:e_commerce/ui/productDetalis/views/Widget/addto_cart.dart';
import 'package:e_commerce/ui/productDetalis/views/Widget/description.dart';
import 'package:e_commerce/ui/productDetalis/views/Widget/detail_app_bar.dart';
import 'package:e_commerce/ui/productDetalis/views/Widget/image_slider.dart';
import 'package:e_commerce/ui/productDetalis/views/Widget/items_details.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetalisScreen extends StatelessWidget {

  const ProductDetalisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetalisController>(builder: (logic) {
      return Scaffold(
        backgroundColor: CColor.contentColor,
        // for add to cart , icon and quantity
        floatingActionButton: AddToCart(product: logic.product!),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for back button share and favorite,
                  DetailAppBar(product: logic.product!,),
                  // for detail image slider
                  MyImageSlider(
                    image: logic.product!.image,
                    onChange: (index) {
                      logic.onChanageCurrentImage(index);
                    },
                  ),
                  SizedBox(height: Get.height*0.013),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) =>
                          AnimatedContainer(
                            duration: const Duration(microseconds: 300),
                            width: logic.currentImage == index ? 15 : 8,
                            height: 8,
                            margin: const EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: logic.currentImage == index
                                  ? Colors.black
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                          ),
                    ),
                  ),
                  SizedBox(height: Get.height*0.025),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    padding:  EdgeInsets.only(
                      left: Get.width*0.05,
                      right: Get.width*0.05,
                      top: Get.height*0.014,
                      bottom: Get.height*0.11,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // for product name, price, rating, and seller
                        ItemsDetails(product: logic.product!),
                        SizedBox(height: Get.height*0.025),
                         Text(
                          "Color",
                          style: AppFontStyle.styleW700(Colors.black, Get.width*0.055),
                        ),
                        SizedBox(height: Get.height*0.025),
                        Row(
                          children: List.generate(
                            logic.colorList.length,
                                (index) =>
                                GestureDetector(
                                  onTap: () {
                                    logic.onChanageCurrentColor(index);
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    width: Get.width*0.085,
                                    height: Get.width*0.085,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: logic.currentColor == index
                                          ? Colors.white
                                          : logic.colorList[index],
                                      border: logic.currentColor == index
                                          ? Border.all(
                                        color: logic.colorList[index],
                                      )
                                          : null,
                                    ),
                                    padding: logic.currentColor == index
                                        ? const EdgeInsets.all(2)
                                        : null,
                                    margin: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      width: Get.width*0.035,
                                      height: Get.width*0.035,
                                      decoration: BoxDecoration(
                                          color: logic.colorList[index],
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(height: Get.height*0.025),
                        // for description
                        Description(description: logic.product!.description,)
                      ],
                    ),
                  )
                ],
              ),
            )),
      );
    });
  }
}