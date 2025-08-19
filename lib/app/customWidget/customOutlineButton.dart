import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';
import '../utils/AppFont.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? btnText;
  final Color? btnColor;
  final Color? outlineColor;
  final Color? txtColor;
  final Size? btnSize;
  final double? fontSize;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final bool? border;
  final bool? bellIcon;

  const CustomOutlinedButton(
      {super.key,
        this.onPressed,
        this.btnText,
        this.border,
        this.txtColor,
        this.btnColor,
        this.btnSize,
        this.bellIcon = false,
        this.prefixWidget,
        this.suffixWidget,
        this.outlineColor,
        this.fontSize = font16});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: btnColor ?? Colors.transparent,
        minimumSize: btnSize ?? const Size(double.infinity, 50),
        maximumSize: btnSize ?? const Size(double.infinity, 50),
        padding: const EdgeInsets.all(0.0),
        side: BorderSide(
            color: outlineColor ?? AppColor.blackColor,
            width: 1,
            style: BorderStyle.solid),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(00.0),
            side: BorderSide(
                color: outlineColor ?? AppColor.blackColor,
                width: 16.0,
                style: BorderStyle.solid)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          prefixWidget ?? const SizedBox(),
          suffixWidget ?? const SizedBox(),
          const SizedBox(
            width: 4.0,
          ),
          Text(
            "$btnText".tr,
            style: Get.textTheme.bodyMedium!.copyWith(
                color: txtColor ?? AppColor.blackColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? font18),
          ),
        ],
      ),
    );
  }
}
