import 'package:auto_route/auto_route.dart';
import 'package:bionic_book_reader/core/local_db_service.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:bionic_book_reader/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../main.dart';
import '../data/tabbarview_states.dart';

class TabBarViewWidget extends ConsumerStatefulWidget {
  final TabClass tabClass;

  const TabBarViewWidget({Key? key, required this.tabClass}) : super(key: key);

  @override
  TabBarViewWidgetState createState() => TabBarViewWidgetState();
}

class TabBarViewWidgetState extends ConsumerState<TabBarViewWidget> {
  TextEditingController? textToProcessCtrl;

  @override
  void initState() {
    super.initState();
    textToProcessCtrl = TextEditingController(
      text: widget.tabClass.textToProcess ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  LocalDatabaseService.updateTabClass(widget.tabClass.id,
                      textToProcess: val);
                },
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: widget.tabClass.enableBtn
                      ? () {
                          textToProcessCtrl?.clear();
                          LocalDatabaseService.updateTabClass(
                              widget.tabClass.id,
                              textToProcess: '');
                        }
                      : null,
                  child: const Text('Clear Text'),
                ),
                ElevatedButton(
                  onPressed: widget.tabClass.enableBtn
                      ? () {
                          context.router.push(ViewBionicTextPage(
                            tabClass: widget.tabClass,
                            /*To update the text in the TabBarView when
                            * the text has been edit from ViewBionicTextPage*/
                            textToProcessFunc: (value) =>
                                textToProcessCtrl?.text = value,
                          ));
                        }
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
        onPressed: () async {
          List<TabClass> tabClassSchemaCount =
              await LocalDatabaseService.getAllTabClassFromLocalDB();

          TabClass tabClass = TabClass(
              tabTitle: 'Tab ${tabClassSchemaCount.length + 1}',
              textToProcess: '');

          LocalDatabaseService.addTabClassToLocalDB(tabClass);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
