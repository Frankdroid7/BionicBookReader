import 'package:bionic_book_reader/core/local_db_service.dart';
import 'package:bionic_book_reader/pages/main_page/home_page/custom_widgets/tabbar_view_widget.dart';
import 'package:bionic_book_reader/pages/main_page/home_page/data/dropdown_states.dart';
import 'package:bionic_book_reader/pages/main_page/home_page/data/tabbarview_states.dart';
import 'package:bloc/bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../custom_widgets/title_widget.dart';
import '../../../utils/constants.dart';
import 'data/model/tabclass.dart';

class HomePage extends ConsumerStatefulWidget {
  HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TabController tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    HomePageDropDownItems dropdownState = ref.watch(dropdownStateProvider);

    return StreamBuilder<List<TabClass>>(
      stream: LocalDatabaseService.getStreamOfTabClass(),
      builder: (context, AsyncSnapshot<List<TabClass>> snapshot) {
        List<TabClass> tabClassList = snapshot.data ?? [];

        if (tabClassList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            ref.read(dropdownStateProvider.notifier).state =
                                val;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: tabClassList.length > 1,
              // visible: ref.read(tabsStateProvider).length > 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      LocalDatabaseService.clearDb();

                      // ref.read(tabsStateProvider.notifier).clearAllTabs();
                    },
                    child: Container(
                      color: Colors.red.withOpacity(0.2),
                      padding: const EdgeInsets.all(4),
                      child: const Text(
                        'Clear all tabs',
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder<int>(
                future: LocalDatabaseService.getCurrentTabBarPosition(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return tabWidget(tabClassList, snapshot.data ?? 0);
                }),
          ],
        );
      },
    );
  }

  // This holds the Tabs and the TabBarView widgets.
  Expanded tabWidget(List<TabClass> tabClassList, int initialIndex) {
    TabController tabBarCtrl = TabController(
        length: tabClassList.length, vsync: this, initialIndex: initialIndex);
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
                  controller: tabBarCtrl,
                  onTap: (index) {
                    LocalDatabaseService.saveCurrentTabBarPosition(index);
                    // tabsProvider.setCurrentIndex(index
                  },
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
                              tabClass.tabTitle,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 10),
                            index != 0
                                ? InkWell(
                                    onTap: () {
                                      // tabsProvider.decrement(index);
                                      LocalDatabaseService.deleteTabClass(
                                          tabClass.id);
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
                controller: tabBarCtrl,
                children: List.generate(
                  tabClassList.length,
                  (index) {
                    return TabBarViewWidget(tabClass: tabClassList[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class TabWidget extends StatefulWidget {
//   final List<TabClass> tabClassList;
//   final int initialIndex;
//   const TabWidget(
//       {Key? key, required this.initialIndex, required this.tabClassList})
//       : super(key: key);
//
//   @override
//   State<TabWidget> createState() => _TabWidgetState();
// }
//
// class _TabWidgetState extends State<TabWidget>
//     with SingleTickerProviderStateMixin {
//   late TabController tabBarCtrl;
//
//   @override
//   void initState() {
//     super.initState();
//     print('tabclasslist length: ${widget.tabClassList.length}');
//     print('initial index: ${widget.initialIndex}');
//     tabBarCtrl = TabController(
//         length: widget.tabClassList.length,
//         vsync: this,
//         initialIndex: widget.initialIndex);
//   }
//
//   @override
//   void dispose() {
//     tabBarCtrl.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 60,
//             child: AppBar(
//               bottom: TabBar(
//                 isScrollable: true,
//                 controller: tabBarCtrl,
//                 onTap: (index) {
//                   LocalDatabaseService.saveCurrentTabBarPosition(index);
//                   // tabsProvider.setCurrentIndex(index
//                 },
//                 tabs: List.generate(
//                   widget.tabClassList.length,
//                   (index) {
//                     TabClass tabClass = widget.tabClassList[index];
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 10.0),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             tabClass.tabTitle,
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w700),
//                           ),
//                           const SizedBox(width: 10),
//                           index != 0
//                               ? InkWell(
//                                   onTap: () {
//                                     LocalDatabaseService.deleteTabClass(
//                                         tabClass.id);
//                                   },
//                                   child: const Icon(Icons.close,
//                                       color: Colors.red),
//                                 )
//                               : const SizedBox.shrink(),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               controller: tabBarCtrl,
//               children: List.generate(
//                 widget.tabClassList.length,
//                 (index) {
//                   return TabBarViewWidget(tabClass: widget.tabClassList[index]);
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
