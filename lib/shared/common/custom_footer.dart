import 'package:flutter/material.dart';
import 'package:portfolio/shared/theme/app_color.dart';
import 'package:portfolio/shared/theme/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomFooter extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;
  final Map<String,String> contactLinks = {
    AppText.email: AppText.emailLink,
    AppText.linkedin: AppText.linkedinLink,
    AppText.github: AppText.githubLink,
  };

  CustomFooter({
    super.key,
    required this.currentIndex,
    required this.onItemTapped
  });

  Future<void> _openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> contactKeyList = contactLinks.keys.toList();
    return BottomAppBar(
      color: AppColor.fadeGreen,
      //elevation: 1,
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(contactLinks.length, (index) {
          String currentKey = contactKeyList[index];
          return GestureDetector(
            onTap: () {
              if (contactLinks[currentKey]!=null) _openUrl(contactLinks[currentKey]!);
            },
            child: Text(
              currentKey,
              style: TextStyle(fontFamily: 'Inter',
                color: AppColor.darkText,
                fontSize: AppText.small
              )
            ),
          );
        }),
      ),
    );
  }
}