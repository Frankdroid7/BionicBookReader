import 'package:isar/isar.dart';

part 'tabbarposition.g.dart';

/*This position refers to the current tab that the user has clicked.
* Basically, we want to display the last tab the user picked when they
* close and reopen the app.*/
@collection
class TabBarPosition {
  final Id id = 1;
  final int position;

  TabBarPosition({required this.position});
}
