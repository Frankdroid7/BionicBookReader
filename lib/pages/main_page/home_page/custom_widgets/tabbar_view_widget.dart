import 'package:auto_route/auto_route.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:bionic_book_reader/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/tabbarview_states.dart';

class TabBarViewWidget extends ConsumerWidget {
  //The index of this TabBarViewWidget within the TabBarView.
  final int? index;

  TabBarViewWidget({Key? key, this.index}) : super(key: key);

  final TextEditingController? textToProcessCtrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TabsProvider tabsProvider = ref.watch(tabsStateProvider.notifier);
    var enableBtn = ref.watch(buttonStateProvider);
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
                  ref.read(buttonStateProvider.notifier).state = val.isNotEmpty;
                },
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: enableBtn
                      ? () => resetTextFieldAndClearTextBtnState(ref)
                      : null,
                  child: const Text('Clear Text'),
                ),
                ElevatedButton(
                  onPressed: enableBtn
                      ? () => context.router.push(ViewBionicTextPage(
                          title: index != null
                              ? ref.read(tabsStateProvider)[index!].tabsTitle
                              : '',
                          textToProcess: textToProcessCtrl!.text))
                      : null,
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
        onPressed: () {
          tabsProvider.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  resetTextFieldAndClearTextBtnState(WidgetRef ref) {
    textToProcessCtrl?.clear();
    ref.read(buttonStateProvider.notifier).state = false;
  }
}

var buttonStateProvider = StateProvider<bool>((ref) => false);
