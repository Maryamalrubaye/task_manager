import 'package:flutter/cupertino.dart';
import 'package:iau_task_manager/utils/main_theme.dart';

class TaskBox extends StatelessWidget {
  final String text;
  final Color color;
  const TaskBox({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 14,
        decoration: const BoxDecoration(
          color: ThemeColors.holderColor,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: color,
            ),
          ),
        ));
  }
}
