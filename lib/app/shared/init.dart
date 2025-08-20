import 'package:get/get.dart';

class Init extends GetxService {
  static Init get instance => Get.find<Init>();

  var name = ''.obs;
  var brandName = ''.obs;

  var sku = ''.obs;
  // var imageString = ''.obs;
  var productDesc = ''.obs;
  var productType = ''.obs;
  var colorValue = ''.obs;
  var valueFirst = ''.obs;
  var colorEyesImages = <String>[].obs;
  var valueSecond = ''.obs;
  var valueThird = ''.obs;
  var productPrice = ''.obs;
  var valueFourth = ''.obs;
  var keyFeature = ''.obs;
  var ulListElements = <String>[].obs;
  var imageString = <String>[].obs;
  var sliderImages = <String>[].obs;
  var colorNames = <String>[].obs;
  var olListElements = <String>[].obs;

}
