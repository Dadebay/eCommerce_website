import 'package:ecommerce_website/app/modules/home/bindings/home_binding.dart';
import 'package:ecommerce_website/app/modules/home/views/home_view.dart';
import 'package:ecommerce_website/app/modules/sign_up/sign_up_view.dart';
import 'package:get/get.dart';

import '../modules/brands/bindings/brands_binding.dart';
import '../modules/brands/views/brands_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUPVIEW,
      page: () => const SignUpView(),
    ),
    GetPage(
      name: _Paths.BRANDS,
      page: () => const BrandsView(),
      binding: BrandsBinding(),
    ),
  ];
}
