import '../domain/study.dart';

class StudyRepository {
  StudyRepository._();

  static final StudyRepository instance = StudyRepository._();

  static Future<List<Study>> fetchStudies() async {
    return [];
  }

}