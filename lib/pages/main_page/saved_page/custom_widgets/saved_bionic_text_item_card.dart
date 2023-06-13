import 'package:bionic_book_reader/custom_widgets/bionic_text_widget.dart';
import 'package:bionic_book_reader/pages/main_page/bionic.dart';
import 'package:flutter/material.dart';

class SavedBionicTextItemCard extends StatelessWidget {
  final String title;
  final String bodyText;
  const SavedBionicTextItemCard(
      {Key? key, required this.title, required this.bodyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 12),
            BionicTextWidget(text: bodyText),
          ],
        ),
      ),
    );
  }
}
