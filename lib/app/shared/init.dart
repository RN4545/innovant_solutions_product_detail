import 'package:get/get.dart';

class Init extends GetxService {
  static Init get instance => Get.find<Init>();

  var name = ''.obs;
  var brandName = ''.obs;
  var price= ''.obs;
  var sku = ''.obs;
  var imageString = ''.obs;
  var productDesc = ''.obs;
  var productType = ''.obs;
  var colorValue = ''.obs;
  var valueFirst = ''.obs;
  var valueSecond = ''.obs;
  var valueThird = ''.obs;
  var valueFourth = ''.obs;
  var keyFeature = ''.obs;
  var ulListElements = <String>[].obs;
  var olListElements = <String>[].obs;

}
