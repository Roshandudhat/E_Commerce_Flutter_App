import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsDetails extends StatelessWidget {
  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: AppFontStyle.styleW700(CColor.black, Get.width*0.06),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$${product.price}",
                  style: AppFontStyle.styleW700(CColor.black, Get.width*0.06),
                ),
                SizedBox(height: Get.height*0.013),
                // for rating
                Row(
                  children: [
                    Container(
                      width: 55,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: CColor.primaryColor,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 15,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${product.rating.rate}".toString(),
                            style: AppFontStyle.styleW700(Colors.white, Get.width*0.035),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Get.height*0.01),
                    Text(
                      "(${product.rating.count} Reviews)",
                      style: AppFontStyle.styleW400(Colors.grey, Get.width*0.035),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: "Category: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextSpan(
                    text: product.category,
                    style: AppFontStyle.styleW700(Colors.black, Get.width*0.040),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
