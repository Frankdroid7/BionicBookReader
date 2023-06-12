import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants.dart';

var dropdownStateProvider = StateProvider<HomePageDropDownItems>(
    (ref) => HomePageDropDownItems.enteringText);

final List<HomePageDropDownItems> dropDownItems = [
  HomePageDropDownItems.enteringText,
  HomePageDropDownItems.uploadingFiles,
  HomePageDropDownItems.enteringUrl,
];

final Map<HomePageDropDownItems, String> dropdownItemsMap = {
  HomePageDropDownItems.enteringText: 'Entering Text',
  HomePageDropDownItems.uploadingFiles: 'Uploading Files',
  HomePageDropDownItems.enteringUrl: 'Entering Url'
};
