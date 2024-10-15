import 'dart:math';
import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/ui/AllProduct/controllers/all_product_controller.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductGrid extends StatelessWidget {
  final Product product;

  ProductGrid({super.key, required this.product});

  final List<Color> customColorList = [
    Color(0xFF00FF00), // Lime Green
    Color(0xFFFFA500), // Orange
    Color(0xFF4B0082), // Indigo
    Color(0xFFEE82EE), // Violet
    Color(0xFF00CED1), // Dark Turquoise
  ];

  List<Color> getRandomColors() {
    List<Color> shuffledList = List.from(customColorList);
    shuffledList.shuffle(Random());
    return shuffledList.take(3).toList();
  }


  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllProductController>(builder: (logic) {
      return GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.productDetalisScreen, arguments: [product]);
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CColor.contentColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * 0.008),
                  Center(
                    child: Hero(
                      tag: product.image,
                      child: Image.network(
                        product.image,
                        width: Get.width * 0.3,
                        height: Get.width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.008),
                  Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.025),
                    child: Text(
                      product.title,
                      maxLines: 3,
                      style: AppFontStyle.styleW700(
                          CColor.black, Get.width * 0.04),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.008),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$${product.price}",
                        style: AppFontStyle.styleW700(CColor.black, Get.width *
                            0.04),
                      ),
                      Row(
                        children: List.generate(
                          3,
                              (index) =>
                              Container(
                                width: Get.width * 0.04,
                                height: Get.width * 0.04,
                                margin: const EdgeInsets.only(right: 4),
                                decoration: BoxDecoration(
                                  color: getRandomColors()[index],
                                  shape: BoxShape.circle,
                                ),
                              ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: Get.width * 0.09,
                    width: Get.width * 0.09,
                    decoration: const BoxDecoration(
                      color: CColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                          if (product.isFavorite) {
                            product.isFavorite = false;
                            Constant.deleteFavorite(product.id);
                          } else {
                            product.isFavorite = true;
                            Constant.addFavorite(product);
                          }
                          logic.update();
                      },
                      child: Icon(
                        product.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      );
    });
  }
}
