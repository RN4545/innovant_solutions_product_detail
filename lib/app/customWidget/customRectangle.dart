import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/utils/AppFont.dart';

class CustomRectangle extends StatelessWidget {
  final String? description;
  final String? otherDescription;
  final String? singleWord;

  const CustomRectangle(
      {super.key, this.description, this.otherDescription, this.singleWord});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300,width: 1.3),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 6,
        //     spreadRadius: 2,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description ?? "",
                style: Get.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: font12,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    otherDescription ?? "",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: font12,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  Text(
                    singleWord ?? "",
                    style: Get.textTheme.bodyMedium!.copyWith(
                      fontSize: font12,
                      decoration: TextDecoration.underline,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Image.asset(
            "assets/images/tabby_new.png",
            height: 24.0,
            width: 50.0,
          ),
        ],
      ),
    );
  }
}
