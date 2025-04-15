import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/features/experiences/domain/experience.dart';

import '../../../shared/theme/app_color.dart';

class ExperienceWidget extends StatelessWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const ExperienceWidget(this.experience, {super.key, required this.isFirst, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Full vertical line
        Positioned(
          left: 7,
          top: isFirst ? 12 : 0,
          bottom: isLast ? 12 : 0,
          child: Container(
            width: 2,
            color: AppColor.olive,
          ),
        ),

        // Row content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dot
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: AppColor.darkText,
                shape: BoxShape.circle,
              ),
            ),

            const SizedBox(width: 16),

            // Experience content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      experience.jobTitle,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: AppColor.darkText,
                      ),
                    ),
                    Text(
                      "${experience.company}  |  ${formatDate(experience.startDate)} - ${formatDate(experience.endDate)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Inter',
                        color: AppColor.darkText,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...experience.missions.map((mission) => Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• "),
                          Expanded(
                            child: Text(
                              mission,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Inter',
                                color: AppColor.darkText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  String formatDate(DateTime? date) {
    if (date == null) return "Now";
    try {
      String formatedDate = DateFormat('MMMM yyyy', 'fr_FR').format(date);
      return formatedDate[0].toUpperCase() + formatedDate.substring(1);
    } catch (e) {
      return "Unavailable Date";
    }
  }
}