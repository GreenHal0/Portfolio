import 'package:flutter/material.dart';
import 'package:portfolio/shared/theme/app_color.dart';
import 'package:portfolio/shared/theme/app_image.dart';
import 'package:portfolio/shared/theme/app_text.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;
  const CustomHeader({super.key, required this.pageTitle});

  @override
  Size get preferredSize => const Size.fromHeight(128);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: ClipOval(
                  child: Image.asset(
                    AppImage.profileAvatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              AppText.headerText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.lightText,
                fontSize: 32
              ),
            ),
          )
        ],
      ),
    );
  }
}