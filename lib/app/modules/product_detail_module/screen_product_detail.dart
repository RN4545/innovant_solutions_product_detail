import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/customWidget/customAppBar.dart';
import 'package:product_detail/app/customWidget/customCircle.dart';
import 'package:product_detail/app/customWidget/customElevatedButton.dart';
import 'package:product_detail/app/customWidget/customOutlineButton.dart';
import 'package:product_detail/app/customWidget/customRectangle.dart';
import 'package:product_detail/app/modules/product_detail_module/screen_product_controller.dart';
import 'package:product_detail/app/shared/init.dart';
import 'package:product_detail/app/utils/AppFont.dart';

class ScreenProductDetail extends GetView<ScreenProductDetailController> {
  const ScreenProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Center(
          child: Text(
            "Once Collection Weekly",
            style: Get.textTheme.bodyMedium!
                .copyWith(fontSize: font14, fontWeight: FontWeight.bold),
          ),
        ),
        showBackButton: true,
        showHeartIcon: true,
        showShareIcon: true,
        showShopBagIcon: true,
        appbarSize: 40.0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return _body();
      }),
      bottomNavigationBar: _bottomButtons(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
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
              height: 24.0,
            ),
            _otherInfoBox(),
            const SizedBox(
              height: 10.0,
            ),
            _quantitySelecter(),
            const SizedBox(
              height: 24.0,
            ),
            _productInfo()
          ],
        ),
      ),
    );
  }

  Widget _imagesSlides() {
    return Obx(() {
      return Column(
        children: [
          CarouselSlider.builder(
            carouselController: controller.sliderController,
            // itemCount: controller.imgList.length,
            itemCount: Init.instance.sliderImages.length,
            itemBuilder: (context, index, realIdx) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  image: DecorationImage(
                    image: NetworkImage(Init.instance.sliderImages[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 300,
              viewportFraction: 1.6,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              onPageChanged: controller.onPageChanged,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              // controller.imgList.length,
              Init.instance.sliderImages.length,
              (index) => GestureDetector(
                onTap: () => controller.animateToPage(index),
                child: Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentIndex.value == index
                        ? Colors.black
                        : const Color(0xFFBF983F),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
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
            Obx(() {
              return Text(
                Init.instance.brandName.value.toUpperCase(),
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: font14),
              );
            }),
            Obx(() {
              return Text(
                // "3.50 KWD",
                "${Init.instance.productPrice.value} KWD",
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: font14),
              );
            }),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Obx(() {
          return Text(
            Init.instance.name.value,
            style: Get.textTheme.bodyMedium!.copyWith(
                fontSize: font14,
                // fontWeight: FontWeight.bold,
                color: Colors.grey),
          );
        }),
        const SizedBox(
          height: 6.0,
        ),
        Obx(() {
          return Text(
            "SKU: ${Init.instance.sku.value}",
            style: Get.textTheme.bodyMedium!.copyWith(
                fontSize: font12,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500),
          );
        }),
      ],
    );
  }

  Widget _colorEyes() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(() {
          final colorNames = Init.instance.colorNames;
          final selectedIndex = controller.selectedColorIndex.value;
          String selectedColor =
              colorNames.isNotEmpty ? colorNames[selectedIndex] : '';
          return Text(
            "Color: $selectedColor",
            style: Get.textTheme.bodyMedium!.copyWith(
                fontSize: font14,
                // fontWeight: FontWeight.bold,
                color: Colors.black54),
          );
        }),
        const SizedBox(
          height: 10.0,
        ),
        Obx(() {
          final eyesColorImages = Init.instance.colorEyesImages;
          if (eyesColorImages.isEmpty) {
            return const SizedBox();
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                eyesColorImages.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(
                    onTap: () {
                      controller.selectColor(index);
                    },
                    child: CustomCircle(
                      borderColor: controller.selectedColorIndex.value == index
                          ? Colors.grey
                          : Colors.black,
                      child: ClipOval(
                        child: Image.network(
                          eyesColorImages[index],
                          width: 40.0,
                          height: 40.0,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error_outline_sharp,
                                  color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
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
              color: Colors.black54),
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

  Widget _productInfo() {
    return Obx(() {
      return Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                controller.toggleProductInfo();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PRODUCT INFORMATION",
                    style: Get.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, fontSize: font14),
                  ),
                  Icon(
                    controller.isProductInfoExpanded.value
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 30.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            if (controller.isProductInfoExpanded.value)
              Text(
                Init.instance.productDesc.value,
                style: Get.textTheme.bodyMedium!
                    .copyWith(fontSize: font12, color: Colors.grey),
              ),
          ],
        ),
      );
    });
  }

  Widget _bottomButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomElevatedButton(
            onTap: () {},
            btnText: "Add to bag",
            primaryColor: Colors.black,
            txtColor: Colors.white,
            fontSize: font14,
            btnSize: const Size(double.infinity, 48.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
          child: CustomOutlinedButton(
            btnSize: const Size(double.infinity, 48.0),
            onPressed: () {},
            fontSize: font14,
            btnText: "Share",
          ),
        )
      ],
    );
  }
}
