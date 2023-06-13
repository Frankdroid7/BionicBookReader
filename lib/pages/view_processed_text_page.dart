import 'package:auto_route/annotations.dart';
import 'package:bionic_book_reader/custom_widgets/bionic_text_widget.dart';
import 'package:bionic_book_reader/custom_widgets/title_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewProcessedTextPage extends StatelessWidget {
  final String title;
  const ViewProcessedTextPage({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: const Icon(Icons.edit, color: Colors.blue),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.save),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: BionicTextWidget(text: title),
      ),
    );
  }
}
