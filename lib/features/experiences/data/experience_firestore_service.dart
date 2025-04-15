import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/experiences/data/experience_model.dart';

class ExperienceFirebaseService {
  ExperienceFirebaseService._();

  static final ExperienceFirebaseService _instance = ExperienceFirebaseService._();
  static final dbExperience =
  FirebaseFirestore.instance
      .collection("experiences")
      .withConverter(
    fromFirestore: ExperienceModel.fromFirestore,
    toFirestore: (ExperienceModel experience, _) => experience.toFirestore(),
  );

  static Future<List<ExperienceModel>> fetchExperiences() async {
    final querySnapshot = await dbExperience.orderBy("endDate", descending: true).get();
    final List<ExperienceModel> experiences = querySnapshot.docs.map((doc) => doc.data()).toList();
    return experiences;
  }

}