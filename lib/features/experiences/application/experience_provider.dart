import 'package:flutter/cupertino.dart';
import 'package:portfolio/features/experiences/data/experience_repository.dart';

import '../domain/experience.dart';

class ExperienceProvider extends ChangeNotifier {
  List<Experience> _experiences = [];

  List<Experience> get experiences => _experiences;

  Future<void> fetchExperiences() async {
    _experiences = await ExperienceRepository.fetchExperiences();
    // _experiences.addAll(fakeExperiences());
    notifyListeners();
  }

  List<Experience> fakeExperiences() {
    List<Experience> exps = [];
    for (int i = 0; i < 5; i++) {
      exps.add(
          Experience(
              "Job number ${i+1}",
              "Company number ${i+1}",
              DateTime.utc(2024, 12-(i+1), 12-(i+1)),
              DateTime.utc(2025, i+1, i+1),
              ["Mission $i.1", "Mission $i.2", "Mission $i.3"]
          )
      );
    }
    return exps;
  }
}