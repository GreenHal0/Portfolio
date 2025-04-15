import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:portfolio/features/experiences/presentation/experience_widget.dart';
import 'package:portfolio/shared/theme/app_text.dart';
import 'package:portfolio/shared/widgets/page_title_widget.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme/app_color.dart';
import '../application/experience_provider.dart';

class ExperiencesPage extends StatefulWidget {
  const ExperiencesPage({super.key});

  @override
  State<ExperiencesPage> createState() => _ExperiencesPageState();
}

class _ExperiencesPageState extends State<ExperiencesPage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
    final experienceProvider = Provider.of<ExperienceProvider>(context, listen: false);
    experienceProvider.fetchExperiences();
  }

  @override
  Widget build(BuildContext context) {
    final experienceProvider = context.watch<ExperienceProvider>();

    return Scaffold(
      backgroundColor: AppColor.beige,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(AppText.experiencesPageTitle),
            ListView(
              shrinkWrap: true,
              children: List.generate(
                experienceProvider.experiences.length,
                (index) {
                  final experience = experienceProvider.experiences[index];
                  return ExperienceWidget(
                    experience,
                    isFirst: index == 0,
                    isLast: index == experienceProvider.experiences.length - 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
