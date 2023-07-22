import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatefulWidget {
  final String title;

  const TitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  bool textBtnClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textBtnClicked
            ? Expanded(child: CustomTextField(onChanged: (val) {}))
            : Text(widget.title),
        TextButton(
          onPressed: () {
            setState(() => textBtnClicked = !textBtnClicked);
          },
          child: Text(
            textBtnClicked ? 'Save' : 'Edit',
            style: const TextStyle(
              color: Colors.yellow,
            ),
          ),
        ),
      ],
    );
  }
}
