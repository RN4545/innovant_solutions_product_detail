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
  ProductDetails? productDetails;
  final NetworkServiceApi _networkServiceApi = NetworkServiceApi();
  final List<String> imgList = List.generate(
    20,
    (index) => "https://picsum.photos/id/${index + 10}/400/300",
  );

  final CarouselSliderController sliderController = CarouselSliderController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchProductData();

    fetchProductDetails();
  }

  void incrementOrder() {
    incrementQuantity++;
  }

  void decrementOrder() {
    if (incrementQuantity > 0) {
      incrementQuantity--;
    }
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentIndex.value = index;
  }

  void animateToPage(int index) {
    sliderController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void nextPage() {
    sliderController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void previousPage() {
    sliderController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void jumpToPage(int index) {
    sliderController.jumpToPage(index);
  }



  Future<void> fetchProductDetails() async {
    try {
      final url =
          "https://klinq.com/rest/V1/productdetails/6701/253620?lang=en&store=KWD";
      final response = await _networkServiceApi.getApi(url);

      // Parse into POJO
      productDetails = ProductDetails.fromJson(response);
      final data = productDetails?.data;

      // -------------------------------
      // Store basic fields
      Init.instance.name.value = data?.name ?? '';
      Init.instance.brandName.value = data?.brandName ?? '';
      Init.instance.price.value = data?.price ?? '';
      Init.instance.sku.value = data?.sku ?? '';
      Init.instance.imageString.value = data?.image ?? '';
      Init.instance.productType.value = data?.type ?? '';

      // -------------------------------
      // Parse description HTML
      final descriptionHtml = data?.description ?? '';
      final document = html_parser.parse(descriptionHtml);

      // Plain text without tags
      Init.instance.productDesc.value = document.body?.text.trim() ?? '';

      // // Extract <ul> elements
      // Init.instance.ulListElements.value = [];
      // final ulElements = document.getElementsByTagName('ul');
      // for (dom.Element ul in ulElements) {
      //   for (dom.Element li in ul.getElementsByTagName('li')) {
      //     Init.instance.ulListElements.add(li.text.trim());
      //   }
      // }
      //
      // // Extract <ol> elements
      // Init.instance.olListElements.value = [];
      // final olElements = document.getElementsByTagName('ol');
      // for (dom.Element ol in olElements) {
      //   for (dom.Element li in ol.getElementsByTagName('li')) {
      //     Init.instance.olListElements.add(li.text.trim());
      //   }
      // }

      // -------------------------------
      // Optional: first 4 configurable options

    } catch (e) {
      Get.log('Error fetching product details: $e');
    }
  }

//old method
  // void fetchProductData() async {
  //   try {
  //     isLoading.value = true;
  //     final response = await _networkServiceApi.getApi(
  //         "https://klinq.com/rest/V1/productdetails/6701/253620?lang=en&store=KWD");
  //     productData.value = response;
  //     final data = response['data'];
  //
  //     Init.instance.name.value = data['name'] ?? 'Something Went Wrong';
  //     Init.instance.brandName.value = data['brand_name'] ?? 'Something Went Wrong';
  //     Init.instance.price.value = data['price'] ?? 'Something Went Wrong';
  //     Init.instance.sku.value = data['sku'] ?? 'Something Went Wrong';
  //     Init.instance.imageString.value = data['image'] ?? 'NA';
  //     Init.instance.productDesc.value = data['description'] ?? 'NA';
  //
  //     Get.log("name : ${Init.instance.name.value}");
  //     Get.log("brand name : ${Init.instance.brandName.value}");
  //     Get.log("SKU name : ${Init.instance.sku.value}");
  //     Get.log("description PRODUCT : ${Init.instance.productDesc.value}");
  //     Get.log("API Response Stored in Init Service");
  //     Get.log("Response from Api : $response");
  //   } catch (e) {
  //     Get.log("Error : $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  void fetchProductData() async {
    try {
      isLoading.value = true;
      final response = await _networkServiceApi.getApi(
          "https://klinq.com/rest/V1/productdetails/6701/253620?lang=en&store=KWD");
      productData.value = response;
      final data = response['data'];

      // Assign other fields
      Init.instance.name.value = data['name'] ?? 'Something Went Wrong';
      Init.instance.brandName.value =
          data['brand_name'] ?? 'Something Went Wrong';
      Init.instance.price.value = data['price'] ?? 'Something Went Wrong';
      Init.instance.sku.value = data['sku'] ?? 'Something Went Wrong';
      Init.instance.imageString.value = data['image'] ?? 'NA';

      // Parse the description
      String description = data['description'] ?? 'NA';
      var document = parse(description);
      var paragraphs = document.getElementsByTagName('p');
      var ulElements = document.getElementsByTagName('ul');
      var olElements = document.getElementsByTagName('ol');

      // Define target paragraphs
      List<String> targetParagraphs = [
        'Anesthesia Once Collection by Anesthesia',
        'Product Type: Contact Lense',
        'Color: Blended Grey, Russet, Olivia, Mistic, Honey, Brownish, Coffee, Cloudio, Caramello, Greyish',
        'The newest addition to the Anesthesia contact lens family, Once is an Anesthesia series for daily wear that combines a wealth of color experience with beauty. Easy to handle, stable and comfortable, it provides a subtle transformation in an instant. With its high water content and Hydrogel technology enabling long-lasting comfort, the Anesthesia Once is the perfect choice for fashion-conscious wearers.',
        'Designed to make your eyes look beautiful, Anesthesia Once Collection by Anesthesia is a perfect lens for both daily wear and special occasions. The color applies like a second skin, gently hugging every curve of your eyes. You can also choose between various powers depending on how much you need them to correct your astigmatism. This will allow you to enjoy your time without worrying about any symptoms of dryness or irritation.',
        'This collection is inspired by the understated and sophisticated glamour of a private room in an exclusive hospital. The Anesthesia collection is the ultimate definition of luxury eyewear that embodies individuality, sophistication, and style. Anesthesia Collection by Anesthesia is the first and only certified, FDA approved collection of eyewear for the modern medical professional.',
        'Key Features:',
        'How To Wear Your Contact Lense:',
      ];

      // Initialize variables
      String filteredDescription = 'NA';
      String filteredProductType = 'NA';
      String filteredColor = 'NA';
      String filteredSentenceParaFirst = 'NA';
      String filteredSentenceParaSecond = 'NA';
      String filteredSentenceParaThird = 'NA';
      String filteredKeyFeature = 'NA';
      String filteredSentenceParaFourth = 'NA';
      List<String> ulListElements = [];
      List<String> olListElements = [];

      // Loop through paragraphs to find matches
      for (var p in paragraphs) {
        String paragraphText = p.text.trim();
        if (paragraphText == targetParagraphs[0]) {
          filteredDescription = paragraphText;
        } else if (paragraphText == targetParagraphs[1]) {
          filteredProductType = paragraphText;
        } else if (paragraphText == targetParagraphs[2]) {
          filteredColor = paragraphText;
        } else if (paragraphText == targetParagraphs[3]) {
          filteredSentenceParaFirst = paragraphText;
        } else if (paragraphText == targetParagraphs[4]) {
          filteredSentenceParaSecond = paragraphText;
        } else if (paragraphText == targetParagraphs[5]) {
          filteredSentenceParaThird = paragraphText;
        } else if (paragraphText == targetParagraphs[6]) {
          filteredKeyFeature = paragraphText;
        } else if (paragraphText == targetParagraphs[7]) {
          filteredSentenceParaFourth = paragraphText;
        }
      }

      if (ulElements.isNotEmpty) {
        var liElements = ulElements.first.getElementsByTagName('li');
        ulListElements = liElements.map((li) => li.text.trim()).toList();
      } else {
        Get.log("Warning: No <ul> found in description");
      }

      if (olElements.isNotEmpty) {
        var liElements = olElements.first.getElementsByTagName('li');
        olListElements = liElements.map((li) => li.text.trim()).toList();
      } else {
        Get.log("Warning: No <ul> found in description");
      }

      // Assign to Init instance
      Init.instance.productDesc.value = filteredDescription;
      Init.instance.productType.value = filteredProductType;
      Init.instance.colorValue.value = filteredColor;
      Init.instance.valueFirst.value = filteredSentenceParaFirst;
      Init.instance.valueSecond.value = filteredSentenceParaSecond;
      Init.instance.valueThird.value = filteredSentenceParaThird;
      Init.instance.keyFeature.value = filteredKeyFeature;
      Init.instance.valueFourth.value = filteredSentenceParaFourth;
      Init.instance.ulListElements.value = ulListElements;
      Init.instance.olListElements.value = olListElements;

      // Logging
      Get.log("name : ${Init.instance.name.value}");
      Get.log("brand name : ${Init.instance.brandName.value}");
      Get.log("SKU name : ${Init.instance.sku.value}");
      Get.log("description PRODUCT : ${Init.instance.productDesc.value}");
      Get.log("product type : ${Init.instance.productType.value}");
      Get.log("UL LIST : ${Init.instance.ulListElements.value}");
      Get.log("API Response Stored in Init Service");
      Get.log("Response from Api : $response");
    } catch (e) {
      Get.log("Error : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
