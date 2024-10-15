import 'package:e_commerce/ui/home/controllers/home_controller.dart';
import 'package:e_commerce/ui/home/views/Widget/home_app_bar.dart';
import 'package:e_commerce/ui/home/views/Widget/image_slider.dart';
import 'package:e_commerce/ui/home/views/Widget/product_cart.dart';
import 'package:e_commerce/ui/home/views/Widget/search_bar.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/font_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (logic) {
      return Scaffold(
        backgroundColor: CColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * 0.01),
                  const CustomAppBar(),
                  SizedBox(height: Get.height * 0.014),
                  const MySearchBAR(),
                  SizedBox(height: Get.height * 0.014),
                  ImageSlider(
                    currentSlide: logic.currentSlider,
                    onChange: (value) {
                      logic.onChanageSlider(value);
                    },
                  ),
                  SizedBox(height:  Get.height * 0.014),
                  // for category selection
                  categoryItems(logic),
                  if (logic.selectedIndex == 0)
                  SizedBox(height: Get.height * 0.014),
                if (logic.selectedIndex == 0)
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Special For You",
                        style: AppFontStyle.styleW700(CColor.black, Get.width*0.06),
                      ),
                      Text(
                        "See all",
                        style:
                        AppFontStyle.styleW700(Colors.black54, Get.width*0.04),
                      ),
                    ],
                  ),
                // for shopping items
                  SizedBox(height: Get.height * 0.014),
                if(logic.productList.isNotEmpty)
                GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: logic.productList.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      product: logic.productList[index],
                    );
                  },
                )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }



  SizedBox categoryItems(HomeController logic) {
    return SizedBox(
      height: Get.height*0.15,
      child: logic.categories.isEmpty ? Center(child: CircularProgressIndicator()): ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: logic.categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              logic.onChanageCategoryIndex(index);
            },
            child: Container(
              padding:  EdgeInsets.symmetric(
                vertical: Get.height*0.02,
                horizontal: Get.width*0.03
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: logic.selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: Get.width*0.15,
                    width: Get.width*0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(logic.categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: Get.height*0.01),
                  Text(
                    logic.categories[index],
                    style: AppFontStyle.styleW700(CColor.black, Get.width*0.04),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }



}