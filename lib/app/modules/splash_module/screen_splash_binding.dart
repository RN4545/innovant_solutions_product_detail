import 'package:get/get.dart';
import 'package:product_detail/app/modules/splash_module/screen_splash_controller.dart';

class ScreenSplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.log("🔥 ScreenSplashBinding loaded");
    Get.lazyPut(
      () => ScreenSplashController(),
    );
  }
}
