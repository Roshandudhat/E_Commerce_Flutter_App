import 'package:e_commerce/ui/cart/controllers/cart_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(),
    );
  }
}
