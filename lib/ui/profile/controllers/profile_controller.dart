import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/preference.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {


  logOut() async {
    await Preference.shared.setString(Preference.accessToken, "");
    Get.offAllNamed(AppRoutes.loginScreen);
  }

}