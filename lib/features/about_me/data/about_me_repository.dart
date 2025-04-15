
import 'package:flutter/services.dart';
import 'package:portfolio/features/about_me/domain/section.dart';
import 'package:portfolio/shared/theme/app_text.dart';

class AboutMeRepository {
  AboutMeRepository._();

  static final AboutMeRepository instance = AboutMeRepository._();

  static Future<List<Section>> fetchSections() async {

    try {
      // Reading file content
      final String content = await rootBundle.loadString(AppText.aboutMeFilePath);
      return parseSection(content);
    } catch (e) {
      return [];
    }
  }

  static List<Section> parseSection(String filePath) {
    final regex = RegExp(r'^(.*)\r?\n([\s\S]*?)(?:\r?\n){2}', multiLine: true);
    final matches = regex.allMatches(filePath);

    return matches.map((match) {
      final title = match.group(1)?.trim() ?? '';
      final content = match.group(2)?.trim() ?? '';
      return Section(title, content);
    }).toList();
  }
}