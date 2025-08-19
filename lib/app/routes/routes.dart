import 'package:get/get.dart';
import 'package:product_detail/app/modules/product_detail_module/screen_product_binding.dart';
import 'package:product_detail/app/modules/product_detail_module/screen_product_detail.dart';
import 'package:product_detail/app/modules/splash_module/screen_splash.dart';
import 'package:product_detail/app/modules/splash_module/screen_splash_binding.dart';
import 'package:product_detail/app/routes/route_names.dart';

class AppPages {
  static const INITIAL = RouteNames.splashScreen;
  static final routes = [
    GetPage(
        name: RouteNames.splashScreen,
        page: () => const ScreenSplash(),
        binding: ScreenSplashBinding()),
    GetPage(
        name: RouteNames.productDetailScreen,
        page: () => const ScreenProductDetail(),
        binding: ScreenProductDetailBinding()),
  ];
}
