import 'package:isar/isar.dart';

part 'tabclass.g.dart';

@collection
class TabClass {
  Id id;
  final bool enableBtn;
  String tabTitle;
  String textToProcess;

  TabClass(
      {this.id = Isar.autoIncrement,
      required this.tabTitle,
      required this.textToProcess})
      : enableBtn = textToProcess.isNotEmpty;
}
