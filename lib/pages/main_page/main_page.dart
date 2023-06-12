import 'package:bionic_book_reader/pages/main_page/home_page/home_page.dart';
import 'package:bionic_book_reader/pages/main_page/saved_page/saved_bionictext_page.dart';
import 'package:bionic_book_reader/utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? userText;
  bool processBtnClicked = false;
  List<Widget> mainPageWidgets = [HomePage(), SavedBionicTextPage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bionic Book Reader'),
      ),
      body: SafeArea(
        child: mainPageWidgets[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        elevation: 15,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
        ],
      ),
    );
  }
}
