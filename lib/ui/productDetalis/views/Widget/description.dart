import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width*0.04,
                vertical: Get.height*0.012
              ),
              decoration: BoxDecoration(
                color: CColor.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child:  Text(
                "Description",
                style: AppFontStyle.styleW700(Colors.white, Get.width*0.04),
              ),
            ),
             Text(
              "Specifications",
              style: AppFontStyle.styleW700(Colors.black, Get.width*0.04)
            ),
            Text(
              "Reviews",
              style: AppFontStyle.styleW700(Colors.black, Get.width*0.04)
            ),
          ],
        ),
        SizedBox(height: Get.height*0.025),
        Text(
          description,
          style:AppFontStyle.styleW700(Colors.grey, Get.width*0.04)
        ),
      ],
    );
  }
}
