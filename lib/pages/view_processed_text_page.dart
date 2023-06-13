import 'package:auto_route/annotations.dart';
import 'package:bionic_book_reader/custom_widgets/bionic_text_widget.dart';
import 'package:bionic_book_reader/custom_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ViewProcessedTextPage extends StatefulWidget {
  final String title;
  final String textToProcess;

  const ViewProcessedTextPage(
      {Key? key, required this.textToProcess, required this.title})
      : super(key: key);

  @override
  State<ViewProcessedTextPage> createState() => _ViewProcessedTextPageState();
}

class _ViewProcessedTextPageState extends State<ViewProcessedTextPage> {
  bool isEditing = false;
  late TextEditingController titleCtrl;
  late TextEditingController textToProcessCtrl;
  @override
  void initState() {
    // TODO: implement initState
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
              isEditing
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomTextField(
                            controller: titleCtrl,
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                      ],
                    )
                  : const SizedBox.shrink(),
              isEditing
                  ? Expanded(
                      child: CustomTextField(
                          expands: true, controller: textToProcessCtrl))
                  : BionicTextWidget(text: textToProcessCtrl.text),
              const SizedBox(height: 10),
              isEditing
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() => isEditing = false);
                      },
                      child: const Text('Save Editing'))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Row(
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
      ),
    );
  }
}
