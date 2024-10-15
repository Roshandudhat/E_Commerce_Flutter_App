import 'package:e_commerce/ui/AllProduct/binding/all_product_binding.dart';
import 'package:e_commerce/ui/AllProduct/views/all_product_screen.dart';
import 'package:e_commerce/ui/Register/binding/register_binding.dart';
import 'package:e_commerce/ui/Register/views/register_screen.dart';
import 'package:e_commerce/ui/Splash/splash_binding/splash_binding.dart';
import 'package:e_commerce/ui/cart/views/cart_screen.dart';
import 'package:e_commerce/ui/favorite/binding/favorite_binding.dart';
import 'package:e_commerce/ui/favorite/views/favorite_screen.dart';
import 'package:e_commerce/ui/home/binding/home_binding.dart';
import 'package:e_commerce/ui/login/binding/login_binding.dart';
import 'package:e_commerce/ui/login/views/login_screen.dart';
import 'package:e_commerce/ui/navbar/binding/navbar_binding.dart';
import 'package:e_commerce/ui/navbar/views/navbar_screen.dart';
import 'package:e_commerce/ui/productDetalis/binding/product_detalis_binding.dart';
import 'package:e_commerce/ui/productDetalis/views/product_detalis_screen.dart';
import 'package:e_commerce/ui/profile/binding/profile_binding.dart';
import 'package:e_commerce/ui/profile/views/profile_screen.dart';
import 'package:get/get.dart';
import '../ui/Splash/views/splash_screen.dart';
import '../ui/cart/binding/cart_binding.dart';
import '../ui/home/views/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.registionScreen,
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.navBarScreen,
      page: () => const NavBarScreen(),
      binding: NavBarBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.productDetalisScreen,
      page: () => const ProductDetalisScreen(),
      binding: ProductDetalisBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.cartScreen,
      page: () => const CartScreen(),
      binding: CartBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.profileScreen,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.favoriteScreen,
      page: () => const FavoriteScreen(),
      binding: FavoriteBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: AppRoutes.allProductScreen,
      page: () => const AllProductScreen(),
      binding: AllProductBinding(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),

  ];
}
