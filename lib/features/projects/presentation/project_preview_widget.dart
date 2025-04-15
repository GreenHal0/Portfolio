import 'package:flutter/cupertino.dart';
import 'package:portfolio/features/projects/domain/project.dart';

import '../../../shared/theme/app_color.dart';
import '../../../shared/theme/app_image.dart';

class ProjectPreviewWidget extends StatelessWidget {
  final Project project;
  
  const ProjectPreviewWidget(this.project, {super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Project info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Project title
              Text(
                project.title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: AppColor.darkText,
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                ),
              ),

              // Project technos
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(project.technos.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: technoWidget(project.technos[index])
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Description part
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Image part
              Expanded(
                flex: 1,
                child: AspectRatio(
                  aspectRatio: 4/3,
                  child: Image.network(
                    project.coverImage,
                    alignment: Alignment.centerLeft,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppImage.imageUnavailable,
                        fit: BoxFit.contain,
                      );
                    }
                  ),
                ),
              ),
              const SizedBox(width: 16.0),

              Expanded(
                flex: 4,
                child: Text(
                  project.synopsis,
                  //overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  softWrap: true,
                  style: TextStyle(
                    color: AppColor.darkText,
                    fontFamily: 'Inter',
                    fontSize: 18
                  ),
                ),
              ),

              // Expanded(
              //   child: SizedBox(
              //     height: 128,
              //     // Synopsis
              //     child: Text(
              //       project.synopsis,
              //       overflow: TextOverflow.ellipsis,
              //       textAlign: TextAlign.justify,
              //       style: TextStyle(
              //         color: AppColor.darkText,
              //         fontFamily: 'Inter',
              //         fontSize: 18
              //       ),
              //     ),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  Widget? technoWidget(String techno) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColor.olive,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Text(
        techno,
        style: TextStyle(
          color: AppColor.lightText,
          fontFamily: 'Inter',
          fontSize: 14,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}