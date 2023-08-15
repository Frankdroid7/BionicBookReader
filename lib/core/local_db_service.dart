import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../pages/main_page/home_page/data/model/tabbarposition.dart';
import '../pages/main_page/home_page/data/model/tabclass.dart';
import '../pages/main_page/home_page/data/tabbarview_states.dart';

class LocalDatabaseService {
  static late Isar isar;

  static Future initializeLocalDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      isar = await Isar.open(
        [TabClassSchema, TabBarPositionSchema],
        directory: dir.path,
      );

      if (await (isar.tabClass.count()) == 0) {
        addTabClassToLocalDB(TabClass(tabTitle: 'Tab 1', textToProcess: ''));
      }
    }
  }

  static Future addTabClassToLocalDB(TabClass tabClass) async {
    await LocalDatabaseService.initializeLocalDB();

    await isar.writeTxn(() async {
      await isar.tabClass.put(tabClass); // put
    });
  }

  static Future<int> getAllTabClassFromLocalDB() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await LocalDatabaseService.initializeLocalDB();

    return await isar.tabClass.where().count(); // get all
  }

  static Stream<List<TabClass>> getStreamOfTabClass() async* {
    /*Adding this delay here so that the method waits for initializeLocalDB()
    * (which is called by main.dart) to complete first, before running it's own
    * functions, otherwise, initializeLocalDB() will be called twice before the
    * isar get a chance to be 'opened' which will cause undesirable outcomes.*/
    await Future.delayed(const Duration(milliseconds: 500));
    await LocalDatabaseService.initializeLocalDB();

    yield* isar.tabClass.where().watch(fireImmediately: true);
  }

  static Future updateTabClass(Id id,
      {String? tabTitle, String? textToProcess}) async {
    isar.writeTxn(() async {
      final tabClass = await isar.tabClass.get(id);
      if (tabTitle != null) {
        tabClass?.tabTitle = tabTitle;
      }
      if (textToProcess != null) {
        tabClass?.textToProcess = textToProcess;
      }
      return await isar.tabClass.put(tabClass!);
    });
  }

  static Future<int> getCurrentTabBarPosition() async {
    return await isar.tabBarPositions.get(1).then((value) {
      return value?.position ?? 0;
    });
  }

  static Future saveCurrentTabBarPosition(int index) async {
    isar.writeTxn(() async {
      await isar.tabBarPositions.put(TabBarPosition(position: index));
    });
  }

  static Future deleteTabClass(int id) async {
    isar.writeTxn(() async {
      return await isar.tabClass.delete(id);
    });
  }

  static Future clearDb() async {
    await isar.writeTxn(() async {
      await isar.tabClass.clear();
      await isar.tabBarPositions.clear();
    });

    /*We did this delay here so that tabs can be fully cleared out
    * before adding a new class*/
    await Future.delayed(const Duration(milliseconds: 50));

    await LocalDatabaseService.addTabClassToLocalDB(
        TabClass(tabTitle: 'Tab 1', textToProcess: ''));
  }
}
