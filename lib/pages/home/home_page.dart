import 'package:crochet_counter/adapter/getx/project/project_controller.dart';
import 'package:crochet_counter/pages/home/project_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<ProjectController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title".tr),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Obx(
          () {
            return ListView.builder(
              itemCount: controller.projects.length,
              itemBuilder: (context, index) => ListTile(
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("exclude".tr),
                          content: Text(
                            "Confirm deletion of project".trParams(
                              {'name': controller.projects[index].name},
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                controller
                                    .delete(controller.projects[index].id);
                                Get.back();
                              },
                              child: Text(
                                "confirm".tr,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text("cancel".tr),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                onTap: () {
                  var project = controller.projects[index];
                  controller.goToProject(project.id, project.name);
                },
                title: Text(
                  controller.projects[index].name,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                subtitle: Text(
                  "${"Lines".tr}: ${controller.projects[index].currentLine} ${"Points".tr}: ${controller.projects[index].point}",
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            isDismissible: false,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            context: context,
            builder: (BuildContext context) {
              return const ProjectForm();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
