import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/data/network/network_service_api.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
import 'package:product_detail/app/data/pojo/productDetails.dart';
import '../../shared/init.dart';

class ScreenProductDetailController extends GetxController {
  var currentIndex = 0.obs;
  var productData = <String, dynamic>{}.obs;
  var isLoading = true.obs;
  var incrementQuantity = 0.obs;
  var isProductInfoExpanded = false.obs;
  ProductDetails? productDetails;
  final NetworkServiceApi _networkServiceApi = NetworkServiceApi();
  final CarouselSliderController sliderController = CarouselSliderController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProductDetails();
  }

  /// to increment the quantity
  void incrementOrder() {
    incrementQuantity++;
  }

  /// to decrement the quantity
  void decrementOrder() {
    if (incrementQuantity > 0) {
      incrementQuantity--;
    }
  }

  /// to toggle the product info container
  void toggleProductInfo() {
    isProductInfoExpanded.value = !isProductInfoExpanded.value;
  }

  /// slider image
  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  /// to animate the slider
  void animateToPage(int index) {
    sliderController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  /// api function to fetch the product detail
  Future<void> fetchProductDetails() async {
    try {
      isLoading.value = true;
      const url =
          "https://klinq.com/rest/V1/productdetails/6701/253620?lang=en&store=KWD";
      final response = await _networkServiceApi.getApi(url);
      productDetails = ProductDetails.fromJson(response);
      final data = productDetails?.data;
      Init.instance.name.value = data?.name ?? '';
      Init.instance.brandName.value = data?.brandName ?? '';
      Init.instance.price.value = data?.price ?? '';
      Init.instance.sku.value = data?.sku ?? '';
      Init.instance.productType.value = data?.type ?? '';
      final descriptionHtml = data?.description ?? '';
      final document = html_parser.parse(descriptionHtml);
      Init.instance.productDesc.value = document.body?.text.trim() ?? '';
      final imagesList = data?.images ?? [];
      final eyesColorsImages = data?.configurableOption
              ?.expand((option) => option.attributes ?? [])
              .map((attr) => attr.swatchUrl)
              .whereType<String>()
              .toList() ??
          [];
      Init.instance.imageString.value = imagesList.cast<String>();
      Init.instance.colorEyesImages.value = eyesColorsImages.cast<String>();
    } catch (e) {
      Get.log('Error fetching product details: $e');
    }finally{
      isLoading.value = false;
    }
  }
}
