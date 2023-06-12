import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/tabbarview_states.dart';

class TabBarViewWidget extends ConsumerWidget {
  const TabBarViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TabsProvider noOfTabsProvider = ref.watch(tabsStateProvider.notifier);
    var clearTxtBtnState = ref.watch(tabBarViewWidgetState);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomTextField(
              maxLines: 5,
              hintText:
                  'Enter the text you want to convert to a Bionic representation',
              onChanged: (val) {
                ref.read(tabBarViewWidgetState.notifier).state = val.isNotEmpty;
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Process Text'),
                ),
                ElevatedButton(
                  onPressed: clearTxtBtnState ? () {} : null,
                  child: Text('Clear Text'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => noOfTabsProvider.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

var tabBarViewWidgetState = StateProvider<bool>((ref) => false);
