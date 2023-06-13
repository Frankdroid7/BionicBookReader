import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final bool expands;
  final String? hintText;
  final TextStyle? textStyle;
  final Function(String val)? onChanged;
  final TextEditingController? controller;

  const CustomTextField(
      {Key? key,
      this.textStyle,
      this.expands = false,
      this.controller,
      this.maxLines,
      this.hintText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      expands: expands,
      maxLines: maxLines,
      controller: controller,
      style: textStyle,
      textAlignVertical: TextAlignVertical.top,
      decoration: InputDecoration(
        hintMaxLines: 2,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
