import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as res;

import 'app/routes/routes.dart';
import 'app/shared/init.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() async => Init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "product-info",
      debugShowCheckedModeBanner: false,
      theme: AppColor.pickTimeTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

      builder: (context, child) {
        return res.ResponsiveBreakpoints.builder(
          child: res.MaxWidthBox(
            maxWidth: 2960,
            child: res.ResponsiveScaledBox(
              autoCalculateMediaQueryData: true,
              width: _getResponsiveValue(context),
              child: child ?? const SizedBox(),
            ),
          ),
          breakpoints: const [
            res.Breakpoint(start: 0, end: 450, name: res.MOBILE),
            res.Breakpoint(start: 451, end: 800, name: res.TABLET),
            res.Breakpoint(start: 801, end: 1920, name: res.DESKTOP),
            res.Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },
    );
  }

  double _getResponsiveValue(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 420 && screenWidth <= 451) {
      return 530;
    } else if (screenWidth > 1023.0 && screenWidth < 1367.0) {
      return screenWidth;
    } else {
      return screenWidth;
    }
  }
}
