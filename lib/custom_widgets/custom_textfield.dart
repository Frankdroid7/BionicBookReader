import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final String? hintText;
  final Function(String val) onChanged;

  const CustomTextField(
      {Key? key, this.maxLines, this.hintText, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
