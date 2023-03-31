import 'package:flutter/material.dart';

import '../utils/main_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double borderRadius;
  final int? maxLines;
  final bool readOnly;
  const TextFieldWidget(
      {Key? key,
      required this.hintText,
      required this.textController,
      required this.borderRadius,
      this.maxLines,
      this.readOnly = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeColors.holderColor,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: ThemeColors.secondaryColor,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: ThemeColors.secondaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
