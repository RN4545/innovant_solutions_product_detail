import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_detail/app/routes/routes.dart';

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
    );
  }
}
