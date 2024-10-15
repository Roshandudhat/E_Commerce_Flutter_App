import 'package:e_commerce/ui/AllProduct/controllers/all_product_controller.dart';
import 'package:get/get.dart';

class AllProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllProductController>(
          () => AllProductController(),
    );
  }
}
