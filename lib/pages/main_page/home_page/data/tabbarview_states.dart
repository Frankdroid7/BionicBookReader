import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../custom_widgets/tabbar_view_widget.dart';

final tabsStateProvider = StateNotifierProvider<TabsProvider, List<TabClass>>(
    (ref) => TabsProvider());

var buttonStateProvider = StateProvider.family<bool, int>(
  (ref, index) {
    return ref.read(tabsStateProvider)[index].enableBtn;
  },
);

class TabsProvider extends StateNotifier<List<TabClass>> {
  TabsProvider()
      : super([
          TabClass(
            tabsTitle: 'Tab 1',
            textToProcess: '',
          ),
        ]);

  changeTextToProcess(int index, String text) {
    state[index] = TabClass(
      tabsTitle: state[index].tabsTitle,
      textToProcess: text,
    );
  }

  void increment() => state = [
        ...state,
        TabClass(
          tabsTitle: 'Tab ${state.length + 1}',
          textToProcess: '',
        )
      ];

  //index is the index of the tab to be deleted.
  void decrement(int index) {
    List<TabClass> tabClassList = [];
    /* This counter is created to hold the final length of the Tabs after
       a tab has been deleted. */
    int counter = 0;
    for (int i = 0; i < state.length; i++) {
      /*If the index of the tab to be deleted is reached, skip it,
        don't increment the counter.*/
      if (state[i].tabsTitle != state[index].tabsTitle) {
        counter++;
      }
    }

    bool conditionToStopLooping(int i) {
      /*If the tab to be deleted is the last Tab in the list, only loop until
      * i is less than the counter because the aren't going to add 1 to i.*/
      return index == state.length - 1 ? i < counter : i <= counter;
    }

    for (int i = 0; conditionToStopLooping(i); i++) {
      if (i == index) {
        i += 1;
      }

      tabClassList.add(TabClass(
        /*If i is after the index which has been deleted,
        we won't add 1 to i because at this point,
        i would have already been incremented by 1. */
        tabsTitle: 'Tab ${i > index ? i : i + 1}',
        textToProcess: state[i].textToProcess,
      ));
    }

    state = tabClassList;
  }

  void clearAllTabs() {
    state = [
      TabClass(tabsTitle: 'Tab 1', textToProcess: state[0].textToProcess),
    ];
  }
}

class TabClass {
  final bool enableBtn;
  final String tabsTitle;
  final String textToProcess;

  TabClass({required this.tabsTitle, required this.textToProcess})
      : enableBtn = textToProcess.isNotEmpty;
}
