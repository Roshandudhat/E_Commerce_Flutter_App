import 'package:e_commerce/ui/DemoUi/controllers/demo_controller.dart';
import 'package:e_commerce/ui/productDetalis/controllers/product_detalis_controller.dart';
import 'package:get/get.dart';

class ProductDetalisBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetalisController>(
          () => ProductDetalisController(),
    );
  }
}
