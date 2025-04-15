import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/experiences/data/experience_model.dart';
import 'package:portfolio/features/projects/data/project_model.dart';

class ProjectFirebaseService {
  ProjectFirebaseService._();

  static final ProjectFirebaseService _instance = ProjectFirebaseService._();
  static final dbProjects =
  FirebaseFirestore.instance
      .collection("projects")
      .withConverter(
    fromFirestore: ProjectModel.fromFirestore,
    toFirestore: (ProjectModel project, _) => project.toFirestore(),
  );

  static Future<List<ProjectModel>> fetchProjects() async {
    final querySnapshot = await dbProjects.get();
    final List<ProjectModel> projects = querySnapshot.docs.map((doc) => doc.data()).toList();
    return projects;
  }

}