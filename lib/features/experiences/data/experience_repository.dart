import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:portfolio/features/experiences/data/experience_firestore_service.dart';
import 'package:portfolio/features/experiences/data/experience_model.dart';

import '../domain/experience.dart';

class ExperienceRepository {
  ExperienceRepository._();

  static final ExperienceRepository instance = ExperienceRepository._();

  static Future<List<Experience>> fetchExperiences() async {
    List<ExperienceModel> experienceModels = await ExperienceFirebaseService.fetchExperiences();
    return List<Experience>.from(experienceModels);
  }

}