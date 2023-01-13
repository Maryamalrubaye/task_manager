import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/main_theme.dart';

class Message {
  static void taskProblemAlert(String taskTitle, String taskProblemAlert) {
    Get.snackbar(
      taskTitle,
      taskProblemAlert,
      backgroundColor: ThemeColors.appMainColor,
      titleText: Text(
        taskTitle,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        taskProblemAlert,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
