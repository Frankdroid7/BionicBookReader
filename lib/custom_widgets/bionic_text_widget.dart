import 'package:flutter/material.dart';

import '../pages/main_page/bionic.dart';

class BionicTextWidget extends StatelessWidget {
  final String text;
  final int? maxLines;
  final TextOverflow textOverflow;

  const BionicTextWidget(
      {Key? key,
      this.textOverflow = TextOverflow.clip,
      this.maxLines,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: maxLines,
      overflow: textOverflow,
      text: TextSpan(
        text: '',
        children: Bionic.processText(text),
      ),
    );
  }
}
