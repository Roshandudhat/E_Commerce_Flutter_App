import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CartController extends GetxController {

  List<Product> cartProductList = [];

  @override
  void onInit() {
    getAllProduct();
    super.onInit();
  }
  getAllProduct() async {
    cartProductList = await Constant.getProducts() ?? [];
    update();
  }

  removeProductForCart(int index) async {
    await Constant.deleteProduct(cartProductList[index].id);
    cartProductList.removeAt(index);
    update();
  }

  producrQuantity(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
          icon == Icons.add
              ? incrementQtn(index)
              : decrementQtn(index);
          update();
      },
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
  incrementQtn(int index) {
    cartProductList[index].quantity = (cartProductList[index].quantity! + 1)!;
    Constant.updateProduct(cartProductList[index]);
  }

  // for decrement
  decrementQtn(int index) {
    if (cartProductList[index].quantity! <= 1) {
      return;
    }
    cartProductList[index].quantity = (cartProductList[index].quantity! - 1)!;
    Constant.updateProduct(cartProductList[index]);
    update();
  }

  // for total amount
  totalPrice() {
    double myTotal = 0.0; // initial
    for (Product element in cartProductList) {
      myTotal += element.price * element.quantity! ?? 0;
    }
    return myTotal.toStringAsFixed(2);
  }


}