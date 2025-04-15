import 'package:flutter/material.dart';
import 'package:portfolio/features/about_me/presentation/section_widget.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme/app_color.dart';
import '../../../shared/theme/app_text.dart';
import '../../../shared/widgets/page_title_widget.dart';
import '../application/about_me_provider.dart';
class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  void initState() {
    super.initState();
    final aboutMeProvider = Provider.of<AboutMeProvider>(context, listen: false);
    aboutMeProvider.fetchSections();
  }

  @override
  Widget build(BuildContext context) {
    final aboutMeProvider = context.watch<AboutMeProvider>();

    return Scaffold(
      backgroundColor: AppColor.beige,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(AppText.aboutMePageTitle),
            ...aboutMeProvider.sections.map((section) =>
              AboutMeSectionWidget(section)
            )
          ],
        ),
      ),
    );
  }
}
