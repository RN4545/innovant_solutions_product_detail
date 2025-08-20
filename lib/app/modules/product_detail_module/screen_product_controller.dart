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
  var selectedColorIndex = 0.obs;
  var isLoading = true.obs;
  var incrementQuantity = 0.obs;
  var isProductInfoExpanded = false.obs;
  final List<int> colorToCarouselMap = [0, 2, 4, 6, 8, 10,12,14,16,18,20];

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

  /// to change the color index
  void selectColor(int index) {
    selectedColorIndex.value = index;
    int carouselIndex = colorToCarouselMap[index];
    sliderController.animateToPage(carouselIndex);
    currentIndex.value = carouselIndex;
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
    final colorIndex = colorToCarouselMap.indexOf(index);
    if (colorIndex != -1) {
      selectedColorIndex.value = colorIndex;
    }
    // else do nothing (keep previous selectedColorIndex)
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
      final rawPrice = data?.price ?? "0";
      Init.instance.productPrice.value =
          double.parse(rawPrice).toStringAsFixed(2);
      Init.instance.sku.value = data?.sku ?? '';
      Init.instance.productType.value = data?.type ?? '';
      final descriptionHtml = data?.description ?? '';
      final document = html_parser.parse(descriptionHtml);
      Init.instance.productDesc.value = document.body?.text.trim() ?? '';
      final imagesList = data?.images ?? [];
      final imagesSlider = data?.configurableOption
          ?.expand((option) => option.attributes ?? [])
          .expand((attr) => attr.images ?? [])
          .map((e) => e.toString())   // cast each item to String
          .toList() ?? [];

      final eyesColorsImages = data?.configurableOption
              ?.expand((option) => option.attributes ?? [])
              .map((attr) => attr.swatchUrl)
              .whereType<String>()
              .toList() ??
          [];
      final colorNames = data?.configurableOption
              ?.expand(
                (option) => option.attributes ?? [],
              )
              .map(
                (attr) => attr.value,
              )
              .whereType<String>()
              .toList() ??
          [];
      Init.instance.colorNames.value = colorNames.cast<String>();
      Init.instance.sliderImages.value = imagesSlider;
      Get.log("color names : ${Init.instance.colorNames.value}");
      Get.log("slider images : ${Init.instance.sliderImages.value}");
      Init.instance.imageString.value = imagesList.cast<String>();
      Init.instance.colorEyesImages.value = eyesColorsImages.cast<String>();
    } catch (e) {
      Get.log('Error fetching product details: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
