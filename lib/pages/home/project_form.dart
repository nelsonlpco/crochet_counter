import 'package:crochet_counter/adapter/getx/project/project_controller.dart';
import 'package:crochet_counter/components/sized_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectForm extends GetView<ProjectController> {
  const ProjectForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Project".tr,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      label: Text("Project Name".tr),
                    ),
                    controller: controller.txtNameController,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedButton(
                        width: 110,
                        height: 45,
                        color: Colors.red,
                        onPress: controller.cancel,
                        child: Text("cancel".tr)),
                    const SizedBox(
                      width: 50,
                    ),
                    SizedButton(
                        width: 110,
                        height: 45,
                        onPress: () {
                          controller.txtNameController.text.isEmpty
                              ? null
                              : controller.newProject();
                        },
                        child: Text("save".tr)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
