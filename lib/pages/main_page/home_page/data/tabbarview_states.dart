import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../custom_widgets/tabbar_view_widget.dart';

final tabsStateProvider =
    StateNotifierProvider<TabsProvider, List<TabClass>>((ref) {
  return TabsProvider();
});

class TabsProvider extends StateNotifier<List<TabClass>> {
  TabsProvider()
      : super([
          TabClass(tabsTitle: 'Tab 1', tabBarViewWidget: TabBarViewWidget())
        ]);

  void increment() => state = [
        ...state,
        TabClass(
            tabsTitle: 'Tab ${state.length + 1}',
            tabBarViewWidget: TabBarViewWidget())
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
