import 'package:flutter/cupertino.dart';

import '../../../shared/theme/app_color.dart';
import '../domain/section.dart';

class AboutMeSectionWidget extends StatelessWidget {
  final Section section;

  const AboutMeSectionWidget(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColor.darkText,
              fontFamily: 'Inter',
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            section.content,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: AppColor.darkText,
              fontFamily: 'Inter',
              fontSize: 18
            ),
          )
        ],
      ),
    );
  }
}