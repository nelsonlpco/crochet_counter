import 'package:crochet_counter/adapter/getx/project_manager/project_manager_controller.dart';
import 'package:crochet_counter/pages/project/components/display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectPage extends GetView<ProjectManagerController> {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.projectName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            controller.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Obx(
              () => Display(
                label: "Line".tr,
                value: "${controller.project.value?.currentLine ?? 0}",
                addEvent: controller.nextLine,
                removeEvent: controller.previousLine,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Obx(
              () => Display(
                label: "Point".tr,
                value: "${controller.project.value?.point ?? 0}",
                addEvent: controller.addPoint,
                removeEvent: controller.removePoint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
