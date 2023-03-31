import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iau_task_manager/utils/main_theme.dart';
import 'package:iau_task_manager/widgets/button.dart';

import '../routes/routes.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/first_page.jpg"),
          ),
        ),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                  text: "Welcome",
                  style: TextStyle(
                      color: ThemeColors.textColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "\nReady to manage Your Tasks?",
                      style: TextStyle(
                          color: ThemeColors.secondaryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routers.getAddTaskRoute());
              },
              child: const Button(
                btnColor: ThemeColors.appMainColor,
                btnLabel: "Add New Task",
                labelColor: ThemeColors.secondaryColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routers.getTaskListRoute());
              },
              child: const Button(
                btnColor: ThemeColors.secondaryColor,
                btnLabel: "View All Tasks",
                labelColor: ThemeColors.appMainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
