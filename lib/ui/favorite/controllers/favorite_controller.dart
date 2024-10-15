import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:get/get.dart';


class FavoriteController extends GetxController {


  List<Product> fProductList = [];

  @override
  void onInit() {
    getAllFavoriteList();
    super.onInit();
  }
  getAllFavoriteList() async {
    fProductList = await Constant.getFavorite() ?? [];
    update();
  }

  removeFavorite(int index) async {
    await Constant.deleteProduct(fProductList[index].id);
    fProductList.removeAt(index);
    update();
  }


}