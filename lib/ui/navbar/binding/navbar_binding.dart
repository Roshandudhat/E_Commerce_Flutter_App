import 'package:e_commerce/ui/AllProduct/controllers/all_product_controller.dart';
import 'package:e_commerce/ui/cart/controllers/cart_controller.dart';
import 'package:e_commerce/ui/favorite/controllers/favorite_controller.dart';
import 'package:e_commerce/ui/home/controllers/home_controller.dart';
import 'package:e_commerce/ui/home/controllers/home_controller.dart';
import 'package:e_commerce/ui/navbar/controllers/navbar_controller.dart';
import 'package:e_commerce/ui/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
          () => NavBarController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
      fenix: true
    );
    Get.lazyPut<CartController>(
          () => CartController(),
      fenix: true
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
      fenix: true
    );
    Get.lazyPut<FavoriteController>(
          () => FavoriteController(),
      fenix: true
    );
    Get.lazyPut<AllProductController>(
          () => AllProductController(),
      fenix: true
    );
  }
}
