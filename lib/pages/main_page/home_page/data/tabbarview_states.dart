import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../custom_widgets/tabbar_view_widget.dart';

final tabsStateProvider = StateNotifierProvider<TabsProvider, List<TabClass>>(
    (ref) => TabsProvider());

class TabsProvider extends StateNotifier<List<TabClass>> {
  TabsProvider()
      : super([
          TabClass(tabsTitle: 'Tab 1', tabBarViewWidget: TabBarViewWidget()),
        ]);

  void increment() => state = [
        ...state,
        TabClass(
            tabsTitle: 'Tab ${state.length + 1}',
            tabBarViewWidget: TabBarViewWidget())
      ];

  void decrement(int index) {
    /* This counter is created to hold the length of the Tabs after
       a tab has been deleted. */
    int counter = 0;
    for (int i = 0; i < state.length; i++) {
      if (state[i].tabsTitle != state[index].tabsTitle) {
        counter++;
      }
    }
    state = [
      for (int i = 0; i < counter; i++)
        TabClass(
            tabsTitle: 'Tab ${i + 1}', tabBarViewWidget: TabBarViewWidget())
    ];
  }
}

class TabClass {
  final String tabsTitle;
  final TabBarViewWidget tabBarViewWidget;

  TabClass({required this.tabsTitle, required this.tabBarViewWidget});
}
