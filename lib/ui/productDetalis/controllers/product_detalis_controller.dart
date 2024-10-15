import 'dart:math';

import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetalisController extends GetxController {

  Product? product;
  int currentImage = 0;
  int currentColor = 1;

  final List<Color> customColorList = [
    Color(0xFF00FF00),  // Lime Green
    Color(0xFFFFA500),  // Orange
    Color(0xFF4B0082),  // Indigo
    Color(0xFFEE82EE),  // Violet
    Color(0xFF00CED1),  // Dark Turquoise
  ];

  List<Color> colorList = [];

  var argument = Get.arguments;
  @override
  void onInit() {
    if(argument != null){
      if(argument[0] != null){
        product =argument[0];
        colorList = getRandomColors();
      }
    }
    super.onInit();
  }


  List<Color> getRandomColors() {
    List<Color> shuffledList = List.from(customColorList);
    shuffledList.shuffle(Random());
    return shuffledList.take(3).toList();
  }


  onChanageCurrentImage(int index){
    currentImage = index;
    update();
  }

  onChanageCurrentColor(int index){
    currentColor = index;
    update();
  }


}