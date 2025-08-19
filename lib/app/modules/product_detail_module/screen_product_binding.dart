import 'package:get/get.dart';
import 'package:product_detail/app/modules/product_detail_module/screen_product_controller.dart';

class ScreenProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ScreenProductDetailController(),
    );
  }
}
