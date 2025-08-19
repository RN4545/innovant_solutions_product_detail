import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/customWidget/customCircle.dart';
import 'package:product_detail/app/customWidget/customRectangle.dart';
import 'package:product_detail/app/modules/product_detail_module/screen_product_controller.dart';
import 'package:product_detail/app/utils/AppFont.dart';

class ScreenProductDetail extends GetView<ScreenProductDetailController> {
  const ScreenProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Once Collection Weekly",
          style: Get.textTheme.bodyMedium!
              .copyWith(fontSize: font18, fontWeight: FontWeight.bold),
        ),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imagesSlides(),
          const SizedBox(
            height: 20.0,
          ),
          _productMetaInfo(),
          const SizedBox(
            height: 22.0,
          ),
          _colorEyes(),
          const SizedBox(
            height: 14.0,
          ),
          _otherInfoBox(),
          const SizedBox(
            height: 10.0,
          ),
          _quantitySelecter()
        ],
      ),
    );
  }

  Widget _imagesSlides() {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller.sliderController,
          itemCount: controller.imgList.length,
          itemBuilder: (context, index, realIdx) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: NetworkImage(controller.imgList[index]),
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 250,
            viewportFraction: 0.9,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            onPageChanged: controller.onPageChanged,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
              () =>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  controller.imgList.length,
                      (index) =>
                      GestureDetector(
                        onTap: () => controller.animateToPage(index),
                        child: Container(
                          width: 10,
                          height: 10,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.currentIndex.value == index
                                ? Colors.black
                                : Colors.amber.shade100,
                          ),
                        ),
                      ),
                ),
              ),
        ),
      ],
    );
  }

  Widget _productMetaInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "ANESTHESIA",
              style: Get.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: font14),
            ),
            Text(
              "3.50 KWD",
              style: Get.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: font14),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          "Once Collection Weekly",
          style: Get.textTheme.bodyMedium!.copyWith(
              fontSize: font14,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          "SKU:anesthesia-once-collection-weekly",
          style: Get.textTheme.bodyMedium!.copyWith(
              fontSize: font12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
      ],
    );
  }

  Widget _colorEyes() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Color:",
          style: Get.textTheme.bodyMedium!.copyWith(
              fontSize: font14,
              fontWeight: FontWeight.bold,
              color: Colors.grey),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            6,
                (index) =>
            const CustomCircle(
              borderColor: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _otherInfoBox() {
    return const CustomRectangle(
      description: "or 4 interest-free payments",
      otherDescription: "0.88 KWD",
      singleWord: "Learn More",
    );
  }

  Widget _quantitySelecter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quantity",
          style: Get.textTheme.bodyMedium!.copyWith(
              fontSize: font14,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade400),
        ),
        const SizedBox(
          height: 14.0,
        ),
        Row(
          children: [
            InkWell(
              onTap: () {
                controller.decrementOrder();
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.rectangle),
                child: Center(
                  child: Text(
                    "-",
                    style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              width: 100.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200, width: 1.0),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.black.withOpacity(0.1),
                  //       blurRadius: 6,
                  //       spreadRadius: 2,
                  //       offset: const Offset(0, 3))
                  // ],
                  shape: BoxShape.rectangle),
              child: Center(
                child: Obx(() {
                  return Text(
                    // "1",
                    controller.incrementQuantity.value.toString(),
                    style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  );
                }),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            InkWell(
              onTap: () {
                controller.incrementOrder();
              },
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                    color: Colors.black, shape: BoxShape.rectangle),
                child: Center(
                  child: Text(
                    "+",
                    style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
