import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iau_task_manager/controllers/data_controller.dart';
import 'package:iau_task_manager/pages/tasks_list.dart';
import 'package:iau_task_manager/utils/main_theme.dart';
import 'package:iau_task_manager/widgets/text_field.dart';

import '../widgets/alerts.dart';
import '../widgets/button.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController taskTitle = TextEditingController();
    TextEditingController taskContent = TextEditingController();

    bool _dataValidation() {
      if (taskTitle.text.trim() == '') {
        Message.taskProblemAlert("Task Title", "You don't have task title");
        return false;
      } else if (taskContent.text.trim() == '') {
        Message.taskProblemAlert("Task Content", "You don't have task Content");
        return false;
      } else if (taskTitle.text.length <= 5) {
        Message.taskProblemAlert(
            "Task Title", "The task title must be at least 5 character!");
        return false;
      } else if (taskContent.text.length <= 10) {
        Message.taskProblemAlert(
            "Task Content", "The task Content must be at least 10 character!");
        return false;
      }
      return true;
    }

    return Scaffold(
      body: Container(
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
                  hintText: "Task title",
                  textController: taskTitle,
                  borderRadius: 25,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFieldWidget(
                  hintText: "Content",
                  textController: taskContent,
                  borderRadius: 25,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (_dataValidation()) {
                      Get.find<DataController>().postData(
                          taskTitle.text.trim(), taskContent.text.trim());
                      Get.to(
                        () => const TaskList(),
                        transition: Transition.circularReveal,
                      );
                    }
                  },
                  child: const Button(
                    btnColor: ThemeColors.appMainColor,
                    btnLabel: "Add",
                    labelColor: ThemeColors.secondaryColor,
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
          ],
        ),
      ),
    );
  }
}
