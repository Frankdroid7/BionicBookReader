import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? userText;

  bool processBtnClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bionic Book Reader'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextField(
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Enter your text here...',
                  border: InputBorder.none,
                ),
                onChanged: (val) => userText = val,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() => processBtnClicked = true);
                  },
                  child: Text('Process')),
              const SizedBox(height: 10),
              const Text(
                'Result:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Visibility(
                  visible: processBtnClicked,
                  child: RichText(
                    text: TextSpan(
                      text: '',
                      children: userText != null
                          ? processText(userText!)
                          : const [TextSpan()],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<TextSpan> processText(String sentence) {
  List<TextSpan> textSpanList = [];

  RegExp numberPattern = RegExp(r'\d+');

  //This variable holds each character of the string(sentence) in a list.
  List<String> sentenceSplit = sentence.split('');

  /*Creating a new list to add each character of the string(sentence) to it.
  *This is because i want to add a empty space (' ') before and after a new line(if there is).
  *(this makes sure it works well if the user adds a new line to the sentence)*/
  List<String> newSentence = [];

  for (int i = 0; i < sentenceSplit.length; i++) {
    String currentCharacter = sentenceSplit[i];

    // Adding and empty space before the new line.
    if (currentCharacter == '\n') {
      newSentence.add(' ');
    }

    newSentence.add(currentCharacter);

    // Adding and empty space after the new line.
    if (sentenceSplit[i] == '\n') {
      newSentence.add(' ');
    }
  }

  // Get an array that contains each word in the string.
  List<String> sentenceList = newSentence.join().split(' ');

  //Perform operation on each of the words.
  for (var element in sentenceList) {
    if (element != "\n") {
      /*  Loop over each word until you get to half of the word.
       E.g if the word is spin, loop over the word and stop at the letter p.*/
      List<String> wordList = element.split('');
      for (int i = 0; i < wordList.length; i++) {
        textSpanList.add(TextSpan(
          text: wordList[i],
          style: TextStyle(
              color: Colors.black,
              fontWeight: i < wordList.length / 2 &&
                      !numberPattern.hasMatch(
                          element) //We are not modifying numbers in any way.
                  ? FontWeight.bold
                  : FontWeight.normal),
        ));
      }

      if (element != sentenceList.last) {
        textSpanList.add(const TextSpan(
          text: ' ',
        ));
      }
    } else {
      textSpanList.add(const TextSpan(
        text: '\n',
      ));
    }
  }

  return textSpanList;
}
