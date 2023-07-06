import 'package:auto_route/annotations.dart';
import 'package:bionic_book_reader/custom_widgets/bionic_text_widget.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewBionicTextPage extends StatefulWidget {
  final String title;
  final String textToProcess;

  const ViewBionicTextPage(
      {Key? key, required this.textToProcess, required this.title})
      : super(key: key);

  @override
  State<ViewBionicTextPage> createState() => _ViewBionicTextPageState();
}

class _ViewBionicTextPageState extends State<ViewBionicTextPage> {
  bool isEditing = false;
  late TextEditingController titleCtrl;
  late TextEditingController textToProcessCtrl;

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController(text: widget.title);
    textToProcessCtrl = TextEditingController(text: widget.textToProcess);
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
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextField(
                        controller: titleCtrl,
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                  ],
                ),
                Expanded(
                    child: CustomTextField(
                        expands: true, controller: textToProcessCtrl)),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      setState(() => isEditing = false);
                    },
                    child: const Text('Save Editing'))
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
