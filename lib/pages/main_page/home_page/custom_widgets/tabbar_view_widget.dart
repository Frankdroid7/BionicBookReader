import 'package:auto_route/auto_route.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:bionic_book_reader/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/tabbarview_states.dart';

class TabBarViewWidget extends ConsumerStatefulWidget {
  //The index of this TabBarViewWidget within the TabBarView.
  final int? index;

  const TabBarViewWidget({Key? key, this.index}) : super(key: key);

  @override
  TabBarViewWidgetState createState() => TabBarViewWidgetState();
}

class TabBarViewWidgetState extends ConsumerState<TabBarViewWidget> {
  TextEditingController? textToProcessCtrl;

  @override
  void initState() {
    super.initState();

    textToProcessCtrl = TextEditingController(
        text: ref.read(tabsStateProvider)[widget.index!].textToProcess ?? '');
  }

  @override
  Widget build(BuildContext context) {
    var enableBtn = ref.watch(buttonStateProvider(widget.index!));
    TabsProvider tabsProvider = ref.watch(tabsStateProvider.notifier);
    var btnStateProvider =
        ref.read(buttonStateProvider(widget.index!).notifier);
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
                  btnStateProvider.state = val.isNotEmpty;
                  tabsProvider.changeTextToProcess(widget.index!, val);
                },
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: enableBtn
                      ? () =>
                          resetTextFieldAndClearTextBtnState(ref, widget.index!)
                      : null,
                  child: const Text('Clear Text'),
                ),
                ElevatedButton(
                  onPressed: enableBtn
                      ? () => context.router.push(ViewBionicTextPage(
                          title: widget.index != null
                              ? ref
                                  .read(tabsStateProvider)[widget.index!]
                                  .tabsTitle
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

  resetTextFieldAndClearTextBtnState(WidgetRef ref, int index) {
    textToProcessCtrl?.clear();
    ref.read(buttonStateProvider(index).notifier).state = false;
    ref.read(tabsStateProvider.notifier).changeTextToProcess(index, '');
  }
}
