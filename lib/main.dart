import 'package:crochet_counter/adapter/getx/project/project_bind.dart';
import 'package:crochet_counter/adapter/getx/project_manager/project_manager_bind.dart';
import 'package:crochet_counter/adapter/getx/translatations/app_messages.dart';
import 'package:crochet_counter/adapter/repository/hive/hive_project_repository.dart';
import 'package:crochet_counter/pages/home/home_page.dart';
import 'package:crochet_counter/pages/project/project_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await HiveProjectRepository.register();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'crochet count',
      debugShowCheckedModeBanner: false,
      locale: const Locale('pt', 'BR'),
      translations: AppMessages(),
      fallbackLocale: const Locale('pt', 'BR'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
          binding: ProjectBinding(),
        ),
        GetPage(
          name: "/project",
          page: () => const ProjectPage(),
          binding: ProjectManagerBinding(),
        ),
      ],
    );
  }
}
