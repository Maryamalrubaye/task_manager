import 'package:flutter/cupertino.dart';

class Button extends StatelessWidget {
  final Color btnColor;
  final String btnLabel;
  final Color labelColor;

  const Button(
      {Key? key,
      required this.btnColor,
      required this.btnLabel,
      required this.labelColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 14,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            btnLabel,
            style: TextStyle(
              fontSize: 18,
              color: labelColor,
            ),
          ),
        ));
  }
}
