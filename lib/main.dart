import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iau_task_manager/controllers/data_controller.dart';
import 'package:iau_task_manager/pages/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  loadData() async {
    await Get.find<DataController>().getData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DataController());
    loadData();
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IAU Task Manager',
      home: StartingPage(),
    );
  }
}
