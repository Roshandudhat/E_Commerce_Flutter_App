import 'package:e_commerce/dio/allRepoDataModel.dart';
import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:get/get.dart';


class AllProductController extends GetxController {
  var isLoading = false.obs;

  List<Product> productList = [];

  @override
  void onInit() {
    super.onInit();
    getAllProduct();
  }

  var allRepoDataModel = AllRepoDataModel();

  void getAllProduct() async {
    try {
      isLoading(true);
      var productData = await allRepoDataModel.getAllProduct(Get.context!);
      if (productData.isNotEmpty) {
        productList.assignAll(productData);
      }
    } finally {
      isLoading(false);
    }
    update();
  }



}