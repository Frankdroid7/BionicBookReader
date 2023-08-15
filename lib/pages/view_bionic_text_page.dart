import 'package:auto_route/annotations.dart';
import 'package:bionic_book_reader/core/local_db_service.dart';
import 'package:bionic_book_reader/custom_widgets/bionic_text_widget.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'main_page/home_page/data/tabbarview_states.dart';

@RoutePage()
class ViewBionicTextPage extends StatefulWidget {
  final TabClass tabClass;
  final Function(String text) textToProcessFunc;

  const ViewBionicTextPage(
      {Key? key, required this.textToProcessFunc, required this.tabClass})
      : super(key: key);

  @override
  State<ViewBionicTextPage> createState() => _ViewBionicTextPageState();
}

class _ViewBionicTextPageState extends State<ViewBionicTextPage> {
  bool isEditing = false;
  late TextEditingController titleCtrl;
  late TextEditingController textToProcessCtrl;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.tabClass.tabTitle);
    textToProcessCtrl =
        TextEditingController(text: widget.tabClass.textToProcess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditing ? const SizedBox.shrink() : Text(titleCtrl.text),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (isEditing) ...[
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextField(
                        controller: titleCtrl,
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                        validator: (val) {
                          //regex to check if the string contains only alphabets
                          RegExp regex = RegExp(r"Tab\s*\d+");
                          if (regex.hasMatch(val!)) {
                            return 'You cannot change your title to Tab followed by a number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    expands: true,
                    controller: textToProcessCtrl,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (widget.tabClass.textToProcess !=
                          textToProcessCtrl.text) {
                        await LocalDatabaseService.updateTabClass(
                            widget.tabClass.id,
                            textToProcess: textToProcessCtrl.text);

                        setState(() => isEditing = false);
                        widget.textToProcessFunc(textToProcessCtrl.text);
                      }
                    }
                  },
                  child: const Text('Save Editing'),
                )
              ] else ...[
                Expanded(
                  child: SingleChildScrollView(
                    child: BionicTextWidget(text: textToProcessCtrl.text),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isEditing
                        ? const SizedBox.shrink()
                        : FloatingActionButton(
                            onPressed: () => setState(() => isEditing = true),
                            backgroundColor: Colors.white,
                            child: const Icon(Icons.edit, color: Colors.blue),
                          ),
                    isEditing
                        ? const SizedBox.shrink()
                        : FloatingActionButton(
                            onPressed: () {},
                            child: const Icon(Icons.save),
                          ),
                  ],
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
