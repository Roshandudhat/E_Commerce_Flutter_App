import 'package:e_commerce/dio/allRepoDataModel.dart';
import 'package:e_commerce/dio/dataModel/category.dart';
import 'package:e_commerce/dio/dataModel/product.dart';
import 'package:e_commerce/utils/constant.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {


  int currentSlider = 0;
  var isLoading = false.obs;
  int selectedIndex = 0;


  final List<Category> categoriesList = [
    Category(
      title: "Shoes",
      image: "assets/shoes.png",
    ),
    Category(
      title: "Jewelry",
      image: "assets/jewelry.png",
    ),
    Category(
      title: "Men's\nFashion",
      image: "assets/men.png",
    ),
    Category(
      title: "Women's\nFashion",
      image: "assets/image1.png",
    ),
  ];
  List<dynamic> categories = [];
  List<Product> productList = [];



  @override
  void onInit() {
    super.onInit();
    fetchCategories();
    getAllProduct();
  }

  onChanageSlider(int index){
    currentSlider = index;
    update();
  }

  var allRepoDataModel = AllRepoDataModel();

  void fetchCategories() async {
    try {
      isLoading(true);
      var categoryList = await allRepoDataModel.getCategory(Get.context!);
      if (categoryList != null) {

        categories.assignAll(categoryList);
      }
    } finally {
      isLoading(false);
    }
    update();
  }

  void getAllProduct() async {
    try {
      isLoading(true);
      var productData = await allRepoDataModel.getProductAll(Get.context!);
      if (productData.isNotEmpty) {
        Constant.productList.clear();
        Constant.productList.assignAll(productData);
        productList.assignAll(productData);
      }
    } finally {
      isLoading(false);
    }
    update();
  }

  onChanageCategoryIndex(int index){
    selectedIndex = index;
    update();
  }




}