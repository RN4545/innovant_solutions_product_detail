import 'package:get/get.dart';

import '../../routes/route_names.dart';

class ScreenSplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2), () {
      Get.log("going to next route");
      // Get.off(() => const ScreenProductDetail());
      Get.offNamed(RouteNames.productDetailScreen);
    });
  }
}
