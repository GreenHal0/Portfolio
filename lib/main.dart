import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/features/about_me/application/about_me_provider.dart';
import 'package:portfolio/features/experiences/application/experience_provider.dart';
import 'package:portfolio/features/projects/application/project_provider.dart';
import 'package:portfolio/shared/common/custom_drawer.dart';
import 'package:portfolio/shared/common/custom_footer.dart';

import 'package:portfolio/shared/theme/app_color.dart';
import 'package:portfolio/shared/theme/app_text.dart';
import 'package:provider/provider.dart';

import 'features/about_me/presentation/about_me_page.dart';
import 'features/experiences/presentation/experiences_page.dart';
import 'features/projects/presentation/projects_preview_page.dart';
// ignore: unused_import
import 'features/studies/presentation/studies_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AboutMeProvider()),
        ChangeNotifierProvider(create: (context) => ExperienceProvider()),
        ChangeNotifierProvider(create: (context) => ProjectProvider()),
        //ChangeNotifierProvider(create: (context) => StudyProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yanis MAQUICHON Portfolio',
        theme: ThemeData(primarySwatch: AppColor.oliveSwatch),
        home: const MainLayout(),
      ),
    );
  }
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final List<String> _pageTitles = [
    AppText.sideNavOption1,
    AppText.sideNavOption2,
    AppText.sideNavOption3,
    // AppText.sideNavOption4
  ];
  final List<Widget> _pages = [
    const AboutMePage(),
    const ProjectsPreviewPage(),
    const ExperiencesPage(),
    // const StudiesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.beige,
      // appBar: CustomHeader(pageTitle: _pageTitles[_currentIndex],),
      body: Row(
        children: [
          // Side navigation
          SizedBox(
            width: MediaQuery.of(context).size.width*(1/5),
            child: CustomDrawer(
              currentIndex: _currentIndex,
              onItemTapped: _onItemTapped,
              pageTitles: _pageTitles,
            ),
          ),
          // Main page content
          Expanded(
            child: _pages[_currentIndex],
          ),
        ],
      ),
      bottomNavigationBar: CustomFooter(currentIndex: _currentIndex, onItemTapped: _onItemTapped),
    );
  }
}
