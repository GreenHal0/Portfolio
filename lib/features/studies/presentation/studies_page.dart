import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/study_provider.dart';
class StudiesPage extends StatefulWidget {
  const StudiesPage({super.key});

  @override
  State<StudiesPage> createState() => _StudiesPageState();
}

class _StudiesPageState extends State<StudiesPage> {
  @override
  void initState() {
    super.initState();
    final studyProvider = Provider.of<StudyProvider>(context, listen: false);
    studyProvider.fetchStudies();
  }

  @override
  Widget build(BuildContext context) {
    final studyProvider = context.watch<StudyProvider>();

    return Scaffold(
      body: Container(),
    );
  }
}
