import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iau_task_manager/controllers/data_controller.dart';
import 'package:iau_task_manager/utils/main_theme.dart';
import 'package:iau_task_manager/widgets/task_box.dart';

import '../routes/routes.dart';
import '../widgets/button.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  _loadData() async {
    await Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    print(Get.find<DataController>().myData.length);
    var text = Get.find<DataController>().myData.length;
    _loadData();
    final leftIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: ThemeColors.secondaryTextColor,
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: ThemeColors.secondaryColor,
      ),
    );
    final rightIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: ThemeColors.deleteBtnColor,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: ThemeColors.secondaryColor,
      ),
    );
    return Scaffold(
      backgroundColor: ThemeColors.secondaryColor,
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 18, top: 65),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 2.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header.jpg"),
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back,
                color: ThemeColors.textColor,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Row(
              children: [
                const Icon(
                  Icons.home,
                  color: ThemeColors.appMainColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ThemeColors.appMainColor),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                Expanded(child: Container()),
                const Icon(
                  Icons.calendar_month,
                  color: ThemeColors.appMainColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  text.toString(),
                  style:
                      TextStyle(fontSize: 20, color: ThemeColors.appMainColor),
                )
              ],
            ),
          ),
          Flexible(child: GetBuilder<DataController>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                      background: leftIcon,
                      secondaryBackground: rightIcon,
                      onDismissed: (DismissDirection direction) {},
                      confirmDismiss: (DismissDirection direction) async {
                        if (direction == DismissDirection.startToEnd) {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18),
                                  height: 400,
                                  decoration: BoxDecoration(
                                    color: const Color(0xBA2C2C4A)
                                        .withOpacity(0.3),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routers.getViewTaskRoute(
                                              controller.myData[index]["ID"]
                                                  .toString()));
                                        },
                                        child: const Button(
                                          btnColor: ThemeColors.appMainColor,
                                          btnLabel: "View Task",
                                          labelColor:
                                              ThemeColors.secondaryColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routers.getEditTaskRoute(
                                              controller.myData[index]["ID"]
                                                  .toString()));
                                        },
                                        child: const Button(
                                          btnColor: ThemeColors.secondaryColor,
                                          btnLabel: "Edit Task",
                                          labelColor: ThemeColors.appMainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                          return false;
                        } else {
                          controller.deleteData(controller.myData[index]["ID"]);
                          return Future.delayed(const Duration(seconds: 1),
                              () => direction == DismissDirection.endToStart);
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 18, right: 18, bottom: 10),
                        child: TaskBox(
                          text: controller.myData[index]["TaskTitle"],
                          color: ThemeColors.secondaryTextColor,
                        ),
                      ));
                });
          }))
        ],
      ),
    );
  }
}
