import 'package:e_commerce/ui/DemoUi/controllers/demo_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(
          () => Controller(),
    );
  }
}
