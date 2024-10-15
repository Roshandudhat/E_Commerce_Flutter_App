import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/ui/productDetalis/controllers/product_detalis_controller.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DetailAppBar extends StatelessWidget {
  final Product product;

  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetalisController>(builder: (logic) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios,),
            ),
            const Spacer(),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {},
              icon: const Icon(Icons.share_outlined),
            ),
            SizedBox(width: Get.width * 0.02),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                if (product.isFavorite) {
                  product.isFavorite = false;
                  Constant.deleteFavorite(product.id);
                } else {
                  product.isFavorite = true;
                  Constant.addFavorite(product);
                }
                logic.update();
              },
              icon: Icon(
                product.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.black,
                size: Get.width * 0.06,
              ),
            ),
          ],
        ),
      );
    });
  }
}
