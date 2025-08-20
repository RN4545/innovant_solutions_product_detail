import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/utils/AppFont.dart';

class CustomCircle extends StatelessWidget {
  final Color? borderColor;

  final double? width;
  final double? height;
  final Widget? child;

  const CustomCircle(
      {super.key, this.borderColor, this.width, this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor ?? Colors.white, width: 1.6),
      ),
      child: child ??
          const Icon(
            Icons.error_outline_sharp,
            size: 24.0,
            color: Colors.grey,
          ),
    );
  }
}
