import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../custom_widgets/tabbar_view_widget.dart';

final tabsStateProvider = StateNotifierProvider<TabsProvider, List<TabClass>>(
    (ref) => TabsProvider());

class TabsProvider extends StateNotifier<List<TabClass>> {
  TabsProvider()
      : super([
          TabClass(
              tabsTitle: 'Tab 1',
              tabBarViewWidget:
                  TabBarViewWidget(textToProcessCtrl: TextEditingController()))
        ]);

  void increment(TextEditingController controller) => state = [
        ...state,
        TabClass(
            tabsTitle: 'Tab ${state.length + 1}',
            tabBarViewWidget: TabBarViewWidget(textToProcessCtrl: controller))
      ];

  void decrement(int index) => state = [
        for (final tab in state)
          if (tab.tabsTitle != state[index].tabsTitle) tab
      ];
}

class TabClass {
  final String tabsTitle;
  final TabBarViewWidget tabBarViewWidget;

  TabClass({required this.tabsTitle, required this.tabBarViewWidget});
}
