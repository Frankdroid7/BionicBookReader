import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:bionic_book_reader/pages/main_page/saved_page/custom_widgets/saved_bionic_text_item_card.dart';
import 'package:flutter/material.dart';

class SavedBionicTextPage extends StatelessWidget {
  const SavedBionicTextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Search your saved bionic texts...',
            onChanged: (String val) {},
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return SavedBionicTextItemCard(
                  title: 'jfjskfjskj ks kjs fkjsl;fkj;skfj'
                      'k kjksjfksjfk s;fkjs;kfjskjf skj ksjksj kslj f;  kjf skf; sf;klj'
                      'kjs;kfjskjf skj ksjksj kslj f;  kjf skf; sf;klj',
                  bionicText: 'skjfjskfjskj ks kjs fkjsl;fkj;skfj'
                      'k kjksj'
                      'ME'
                      'kjs;kfjskjf skj ksjksj kslj f;  kjf skf; sf;kljkjs;kfjskjf skj ksjksj kslj f;  kjf skf; sf;klj');
            }),
          ),
        ],
      ),
    );
  }
}
