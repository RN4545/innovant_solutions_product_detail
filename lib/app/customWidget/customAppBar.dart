import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final double? elevation;
  final double? appbarSize;
  final Color? backButtonColor;
  final Color? appbarColor;
  final bool? showHeartIcon;
  final bool? showShareIcon;
  final bool? showShopBagIcon;
  final List<Widget>? actionsChildren;
  final VoidCallback? onBackTap;
  final bool? showBackButton;
  final Widget? suffixWidget;
  final bool? readOnly;

  final bool? borderRadiusEnabled;

  const CustomAppbar({
    super.key,
    this.title,
    this.onBackTap,
    this.leading,
    this.actionsChildren,
    this.backButtonColor,
    this.appbarColor,
    this.elevation,
    this.appbarSize,
    this.showBackButton,
    this.suffixWidget,
    this.readOnly,
    this.showHeartIcon,
    this.showShareIcon,
    this.showShopBagIcon,
    this.borderRadiusEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: AppBar(
        leading: StatefulBuilder(
          builder: (ctx, setState) {
            return showBackButton == true
                ? IconButton(
                    color: backButtonColor ?? Colors.black,
                    onPressed: onBackTap ??
                        () {
                          // Get.back();
                        },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 18.0,
                      color: AppColor.blackColor,
                      weight: 1.0,
                    ),
                  )
                : leading ?? const SizedBox();
          },
        ),
        title: title,
        backgroundColor: appbarColor ?? AppColor.whiteColor,
        surfaceTintColor: AppColor.whiteColor,
        actions: [
          if (showHeartIcon == true)
            Image.asset(
              "assets/images/heartIcon.png",
              width: 22.0,
              height: 22.0,
            ),
          if (showShareIcon == true)
            Image.asset(
              "assets/images/shareIcon.png",
              width: 22.0,
              height: 22.0,
            ),
          if (showShopBagIcon == true)
            Image.asset(
              "assets/images/shoppingBagIcon.png",
              width: 22.0,
              height: 22.0,
            ),

          ...(actionsChildren ?? []),
        ],
        shape: (borderRadiusEnabled ?? false)
            ? const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.0),
                ),
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(
        appbarSize ?? (showBackButton == true ? 80.0 : 56.0));
  }
}
