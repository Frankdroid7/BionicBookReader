import 'package:auto_route/auto_route.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:bionic_book_reader/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/tabbarview_states.dart';

class TabBarViewWidget extends ConsumerWidget {
  TabBarViewWidget({Key? key}) : super(key: key);

  TextEditingController textToProcessCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TabsProvider noOfTabsProvider = ref.watch(tabsStateProvider.notifier);
    var enableClearTextBtn = ref.watch(clearTextBtnProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: CustomTextField(
                expands: true,
                controller: textToProcessCtrl,
                hintText:
                    'Enter the text you want to convert to a Bionic representation...',
                onChanged: (val) {
                  ref.read(clearTextBtnProvider.notifier).state =
                      val.isNotEmpty;
                },
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: enableClearTextBtn
                      ? () => resetTextFieldAndClearTextBtnState(ref)
                      : null,
                  child: const Text('Clear Text'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.router.push(
                        ViewProcessedTextPage(title: textToProcessCtrl.text));
                  },
                  child: const Text('Process Text'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => noOfTabsProvider.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }

  resetTextFieldAndClearTextBtnState(WidgetRef ref) {
    textToProcessCtrl.clear();
    ref.read(clearTextBtnProvider.notifier).state = false;
  }
}

var clearTextBtnProvider = StateProvider<bool>((ref) => false);
