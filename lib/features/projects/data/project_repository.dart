
import 'package:portfolio/features/projects/data/project_firestore_service.dart';
import 'package:portfolio/features/projects/data/project_model.dart';

import '../domain/project.dart';

class ProjectRepository {
  ProjectRepository._();

  static final ProjectRepository instance = ProjectRepository._();

  static Future<List<Project>> fetchProjects() async {
    List<ProjectModel> projectModels = await ProjectFirebaseService.fetchProjects();
    return List<Project>.from(projectModels);
  }

}