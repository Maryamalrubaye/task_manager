import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iau_task_manager/utils/main_theme.dart';
import 'package:iau_task_manager/widgets/text_field.dart';

import '../widgets/button.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController taskTitle = TextEditingController();
    TextEditingController taskContent = TextEditingController();

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
                  onPressed: () {},
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
                const Button(
                  btnColor: ThemeColors.appMainColor,
                  btnLabel: "Add",
                  labelColor: ThemeColors.secondaryColor,
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
