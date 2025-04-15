import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Container(),
    );
  }
}
