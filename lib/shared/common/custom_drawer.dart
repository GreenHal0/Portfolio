import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/shared/theme/app_color.dart';

import '../theme/app_image.dart';

class CustomDrawer extends StatelessWidget {
  final int currentIndex;
  final List<String> pageTitles;
  final Function(int) onItemTapped;

  const CustomDrawer({super.key,
    required this.currentIndex,
    required this.pageTitles,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.olive,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width/10,
                    width: MediaQuery.of(context).size.width/10,
                    child: ClipOval(
                      child: Image.asset(
                        AppImage.profileAvatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Yanis MAQUICHON",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: AppColor.lightText,
                      fontSize: 24,
                    )
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(pageTitles.length, (index) {
                  final isActive = index == currentIndex;
                  return GestureDetector(
                    onTap: () {
                      onItemTapped(index);
                    },
                    child: Padding(
                      padding: isActive ? const EdgeInsets.symmetric(vertical: 16.0) : EdgeInsets.zero,
                      child: Text(
                        isActive ? "· ${pageTitles[index]}" : pageTitles[index],
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          color: AppColor.lightText,
                          fontSize: MediaQuery.of(context).size.width/45,
                          fontStyle: FontStyle.italic,
                          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.width/10,
              width: MediaQuery.of(context).size.width/10,
            ),
          ),
        ],
      ),
    );
  }
}