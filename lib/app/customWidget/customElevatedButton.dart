import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/app_theme.dart';
import '../utils/AppFont.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? iconData;
  final VoidCallback? onTap;
  final String? btnText;
  final Color? primaryColor;
  final Size? btnSize;
  final bool? showIcon;
  final Icon? icon;
  final double? fontSize;
  final BorderRadiusGeometry? borderRadius;
  final bool? isDisable;
  final Color? txtColor;

  const CustomElevatedButton(
      {super.key,
        this.iconData,
        this.icon,
        this.onTap,
        this.btnText,
        this.showIcon =false,
        this.primaryColor,
        this.borderRadius,
        this.btnSize,
        this.fontSize,
        this.isDisable,
        this.txtColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // primary: Colors.transparent,
        // shadowColor: Colors.transparent,
        minimumSize: btnSize ??   Size(MediaQuery.of(context).size.width, 56.0),
        maximumSize: btnSize ??   Size(MediaQuery.of(context).size.width, 56.0),
        padding: const EdgeInsets.all(0.0),
        shape:
        RoundedRectangleBorder(borderRadius: borderRadius ??BorderRadius.circular(80.0)),
      ),
      onPressed: onTap,
      child: Container(
        decoration: BoxDecoration(

            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade300, spreadRadius: 0.2, blurRadius: 2.0),

            ],
            gradient: isDisable == true
                ? const LinearGradient(
              colors: [Colors.black12, Colors.black12],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
                : LinearGradient(
              colors: [
                primaryColor ?? AppColor.primaryColor,
                primaryColor ?? AppColor.primaryColor
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            // borderRadius = borderRadius ?? BorderRadius.circular(60.0),
            borderRadius: borderRadius ?? BorderRadius.circular(00.0)),
        child: Container(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          // constraints: BoxConstraints(maxWidth: btnSize!.width , minHeight: btnSize!.height),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              iconData ?? const SizedBox(),
              SizedBox(
                width: iconData == null ? 0.0 : 10.0,
              ),
              Flexible(
                child: Text(
                  "$btnText".tr,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyMedium!.copyWith(
                      fontSize: fontSize ?? font16,
                      fontWeight: FontWeight.bold,
                      color: txtColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
