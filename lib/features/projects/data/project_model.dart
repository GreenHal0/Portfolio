import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio/features/experiences/domain/experience.dart';
import 'package:portfolio/features/projects/domain/project.dart';

class ProjectModel extends Project{
  final String title;
  final String coverImage;
  final List<String> technos;
  final String synopsis;
  final String? details;
  final List<String>? imageLibrary;


  ProjectModel({
    required this.title,
    required this.coverImage,
    required this.technos,
    required this.synopsis,
    required this.details,
    required this.imageLibrary
  }) : super(title, coverImage, technos, synopsis, details, imageLibrary);

  // Factory constructor for Cloud Firestore deserialization
  factory ProjectModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ProjectModel(
      title: data?['title'],
      coverImage: data?['company'] ?? "",
      technos: (data?['technos'] as String?)?.split(';').map((e) => e.trim()).toList() ?? [],
      synopsis: data?['synopsis'],
      details: data?['details'],
      imageLibrary: (data?['imageLibrary'] as String?)?.split(';').map((e) => e.trim()).toList() ?? [],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "title": title,
      "coverImage": coverImage,
      if (technos.isNotEmpty) "technos": technos.join(';'),
      "synopsis": synopsis,
      "details": details,
      if (imageLibrary!=null && imageLibrary!.isNotEmpty) "imageLibrary": imageLibrary!.join(';'),
    };
  }
}