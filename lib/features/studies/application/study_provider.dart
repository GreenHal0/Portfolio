import 'package:flutter/cupertino.dart';

import '../data/study_repository.dart';
import '../domain/study.dart';

class StudyProvider extends ChangeNotifier {
  List<Study> _studies = [];

  List<Study> get studies => _studies;

  Future<void> fetchStudies() async {
    _studies = await StudyRepository.fetchStudies();
    notifyListeners();
  }
}