import 'package:e_commerce/ui/AllProduct/views/all_product_screen.dart';
import 'package:e_commerce/ui/cart/views/cart_screen.dart';
import 'package:e_commerce/ui/favorite/views/favorite_screen.dart';
import 'package:e_commerce/ui/home/views/home_screen.dart';
import 'package:e_commerce/ui/profile/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NavBarController extends GetxController {


  int cuttentIndex = 2;
  List screens = const [
    AllProductScreen(),
    FavoriteScreen(),
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  onChanageIndex(int index){
    cuttentIndex = index;
    update();
  }


}