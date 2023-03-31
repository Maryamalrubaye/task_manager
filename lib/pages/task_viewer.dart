import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iau_task_manager/controllers/data_controller.dart';

import '../utils/main_theme.dart';
import '../widgets/text_field.dart';

class TaskViewer extends StatelessWidget {
  final int id;
  const TaskViewer({Key? key, required this.id}) : super(key: key);
  _loadSpecificTask() async {
    print("passed id: $id");
    await Get.find<DataController>().getSpecificData(id.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadSpecificTask();
    TextEditingController taskTitle = TextEditingController();
    TextEditingController taskContent = TextEditingController();

    return Scaffold(body: GetBuilder<DataController>(
      builder: (controller) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: const EdgeInsets.only(left: 16, right: 16),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage("assets/inner.jpg"))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: ThemeColors.textColor,
                  ),
                ],
              ),
              Column(
                children: [
                  TextFieldWidget(
                    hintText: '${controller.oneData["TaskTitle"]}',
                    textController: taskTitle,
                    borderRadius: 25,
                    maxLines: 1,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFieldWidget(
                    hintText: '${controller.oneData["TaskContent"]}',
                    textController: taskContent,
                    borderRadius: 25,
                    maxLines: 5,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
            ],
          ),
        );
      },
    ));
  }
}
