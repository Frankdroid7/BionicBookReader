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
      children: [
        textBtnClicked
            ? const SizedBox(width: 70, child: TextField())
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
