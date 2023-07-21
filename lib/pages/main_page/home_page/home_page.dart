import 'package:bionic_book_reader/pages/main_page/home_page/custom_widgets/tabbar_view_widget.dart';
import 'package:bionic_book_reader/pages/main_page/home_page/data/dropdown_states.dart';
import 'package:bionic_book_reader/pages/main_page/home_page/data/tabbarview_states.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../custom_widgets/title_widget.dart';
import '../../../utils/constants.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    HomePageDropDownItems dropdownState = ref.watch(dropdownStateProvider);
    tabController =
        TabController(length: ref.watch(tabsStateProvider).length, vsync: this);

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
        tabWidget(ref),
      ],
    );
  }

  //This holds the Tabs and the TabBarView widgets.
  Expanded tabWidget(WidgetRef ref) {
    List<TabClass> tabClassList = ref.watch(tabsStateProvider);
    TabsProvider tabsProvider = ref.watch(tabsStateProvider.notifier);
    return Expanded(
      child: DefaultTabController(
        length: tabClassList.length,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: AppBar(
                bottom: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  tabs: List.generate(
                    tabClassList.length,
                    (index) {
                      TabClass tabClass = tabClassList[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              tabClass.tabsTitle,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 10),
                            index != 0
                                ? InkWell(
                                    onTap: () {
                                      tabsProvider.decrement(index);
                                    },
                                    child: const Icon(Icons.close,
                                        color: Colors.red),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: List.generate(
                  tabClassList.length,
                  (index) => TabBarViewWidget(index: index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
