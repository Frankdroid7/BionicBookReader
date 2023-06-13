/*This class holds all methods that has to do with the bionic text computation,
* such as processing the text, etc */
import 'package:flutter/material.dart';

class Bionic {
  static List<TextSpan> processText(String sentence, {double? fontSize}) {
    List<TextSpan> textSpanList = [];

    //Regex to match only digits and not any other character.
    RegExp numberPattern = RegExp(r'^\d+$');

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
                fontSize: fontSize ?? 14,
                fontWeight: i < wordList.length / 2 &&
                        !numberPattern.hasMatch(
                            element) //We are not modifying string that contain 'only numbers', such as 12389
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
}
