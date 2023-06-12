import 'package:bionic_book_reader/pages/main_page/home_page/data/dropdown_states.dart';
import 'package:bionic_book_reader/pages/main_page/home_page/data/tabbarview_states.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../custom_widgets/title_widget.dart';
import '../../../utils/constants.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TabClass> tabClassList = ref.watch(tabsStateProvider);
    TabsProvider tabsProvider = ref.watch(tabsStateProvider.notifier);
    HomePageDropDownItems dropdownState = ref.watch(dropdownStateProvider);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: DottedBorder(
            color: Colors.black,
            strokeWidth: 1,
            dashPattern: const [5, 5],
            child: Row(
              children: [
                const Flexible(
                  child: Text(
                    'Generate bionic text by:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Flexible(
                  child: DropdownButtonFormField<HomePageDropDownItems>(
                    padding: const EdgeInsets.all(4),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    isExpanded: true,
                    value: dropdownState,
                    items: dropDownItems
                        .map((e) => DropdownMenuItem<HomePageDropDownItems>(
                              value: e,
                              child: Text(dropdownItemsMap[e]!),
                            ))
                        .toList(),
                    onChanged: (val) {
                      if (val != null) {
                        ref.read(dropdownStateProvider.notifier).state = val;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: DefaultTabController(
            length: tabClassList.length,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: AppBar(
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: List.generate(
                        tabClassList.length,
                        (index) {
                          TabClass tabClass = tabClassList[index];
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TitleWidget(title: tabClass.tabsTitle),
                              index != 0
                                  ? InkWell(
                                      onTap: () {
                                        tabsProvider.decrement(index);
                                      },
                                      child:
                                          Icon(Icons.close, color: Colors.red),
                                    )
                                  : SizedBox.shrink(),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                      children:
                          tabClassList.map((e) => e.tabBarViewWidget).toList()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
