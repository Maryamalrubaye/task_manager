import 'package:get/get.dart';

import '../pages/add_new_task.dart';
import '../pages/start.dart';
import '../pages/task_editer.dart';
import '../pages/task_viewer.dart';
import '../pages/tasks_list.dart';

class Routers {
  static String home = "/";
  static String taskList = "/taskList";
  static String addTask = "/addTask";
  static String editTask = "/editTask";
  static String viewTask = "/viewTask";

  static String getMainRoute() => home;
  static String getTaskListRoute() => taskList;
  static String getAddTaskRoute() => addTask;
  static String getEditTaskRoute(String id) => '$editTask?id=$id';
  static String getViewTaskRoute(String id) => '$viewTask?id=$id';
  static List<GetPage> routes = [
    GetPage(name: home, page: () => const StartingPage()),
    GetPage(
        name: addTask,
        page: () => const AddNewTask(),
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 600)),
    GetPage(
        name: taskList,
        page: () => const TaskList(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 600)),
    GetPage(
        name: editTask,
        page: () {
          var id = Get.parameters['id'];
          return EditTask(id: int.parse(id!));
        },
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 600)),
    GetPage(
        name: viewTask,
        page: () {
          var id = Get.parameters['id'];
          return TaskViewer(id: int.parse(id!));
        },
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 600)),
  ];
}
