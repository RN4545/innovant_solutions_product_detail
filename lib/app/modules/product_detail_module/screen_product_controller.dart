import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenProductDetailController extends GetxController {
  var currentIndex = 0.obs;
  var incrementQuantity = 0.obs;

  final List<String> imgList = List.generate(
    20,
    (index) => "https://picsum.photos/id/${index + 10}/400/300",
  );

  final CarouselSliderController sliderController = CarouselSliderController();

  void incrementOrder() {
    incrementQuantity++;
  }

  void decrementOrder() {
    if(incrementQuantity >0){
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
}
