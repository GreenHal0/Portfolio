import 'package:flutter/cupertino.dart';

import '../data/about_me_repository.dart';
import '../domain/section.dart';

class AboutMeProvider extends ChangeNotifier {
  List<Section> _sections = [];

  List<Section> get sections => _sections;

  Future<void> fetchSections() async {
    _sections = await AboutMeRepository.fetchSections();
    notifyListeners();
  }
}