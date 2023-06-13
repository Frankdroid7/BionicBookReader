import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final bool expands;
  final String? hintText;
  final Function(String val) onChanged;
  final TextEditingController? controller;

  const CustomTextField(
      {Key? key,
      this.expands = false,
      this.controller,
      this.maxLines,
      this.hintText,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      expands: expands,
      maxLines: maxLines,
      controller: controller,
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
