import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/modules/splash_module/screen_splash_controller.dart';
import 'package:product_detail/app/utils/AppFont.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ScreenSplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Innovant Solutions",
              style: Get.textTheme.bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: font20),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}