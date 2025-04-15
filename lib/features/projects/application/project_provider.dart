import 'package:flutter/cupertino.dart';
import 'package:portfolio/features/projects/data/project_repository.dart';
import 'package:portfolio/shared/theme/app_image.dart';

import '../domain/project.dart';

class ProjectProvider extends ChangeNotifier {
  List<Project> _projects = [];

  List<Project> get projects => _projects;

  Future<void> fetchProjects() async {
    _projects = await ProjectRepository.fetchProjects();
    // _projects.addAll(fakeProjects());
    notifyListeners();
  }

  List<Project> fakeProjects() {
    List<Project> pjpv = [];
    for (int i = 0; i < 5; i++) {
      pjpv.add(
        Project(
          "Project number $i",
          AppImage.imageUnavailable,
          ["Techno 1", "Techno Deux"],
          """Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Proin accumsan erat sit amet vestibulum pretium. \nSuspendisse mollis, libero eget sodales posuere, quam enim gravida magna, ac lobortis tortor quam ut nisi. Nullam commodo velit consectetur odio viverra finibus. Phasellus scelerisque est eu diam ornare, vitae euismod diam cursus. \nPhasellus sit amet lectus vulputate, laoreet lorem sed, molestie erat. Quisque pretium nulla urna, at pulvinar nulla malesuada eget. In eu massa sit amet massa laoreet cursus. Maecenas aliquam pulvinar erat id porttitor. Integer bibendum placerat sem,""",
          null,
          null
        )
      );
    }
    return pjpv;
  }
}