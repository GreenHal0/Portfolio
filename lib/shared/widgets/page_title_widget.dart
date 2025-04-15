import 'package:flutter/cupertino.dart';

import '../theme/app_color.dart';

class PageTitle extends StatelessWidget {
  final String pageTitle;

  const PageTitle(this.pageTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 128),
      child: Center(
        child: Text(
          pageTitle,
          style: TextStyle(
            fontFamily: 'Inter',
            color: AppColor.darkText,
            fontSize: 64,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}