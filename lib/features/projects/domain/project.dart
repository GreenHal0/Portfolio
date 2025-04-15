import 'package:portfolio/features/about_me/domain/section.dart';

class Project {
  final String title;
  final String coverImage;
  final List<String> technos;
  final String synopsis;
  final String? details;
  final List<String>? imageLibrary;

  Project(
    this.title,
    this.coverImage,
    this.technos,
    this.synopsis,
    this.details,
    this.imageLibrary
  );
}