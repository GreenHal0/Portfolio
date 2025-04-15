import 'package:flutter/material.dart';
import 'package:portfolio/features/projects/presentation/project_preview_widget.dart';
import 'package:provider/provider.dart';

import '../../../shared/theme/app_color.dart';
import '../../../shared/theme/app_text.dart';
import '../../../shared/widgets/page_title_widget.dart';
import '../application/project_provider.dart';
class ProjectsPreviewPage extends StatefulWidget {
  const ProjectsPreviewPage({super.key});

  @override
  State<ProjectsPreviewPage> createState() => _ProjectsPreviewPageState();
}

class _ProjectsPreviewPageState extends State<ProjectsPreviewPage> {
  @override
  void initState() {
    super.initState();
    final projectProvider = Provider.of<ProjectProvider>(context, listen: false);
    projectProvider.fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    final projectProvider = context.watch<ProjectProvider>();

    return Scaffold(
      backgroundColor: AppColor.beige,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageTitle(AppText.projectPageTitle),
            ...projectProvider.projects.map((project) =>
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 48, 0),
                  child: ProjectPreviewWidget(project),
                )
            )
          ],
        ),
      ),
    );
  }
}
