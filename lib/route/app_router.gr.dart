// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:bionic_book_reader/pages/main_page/home_page/data/model/tabclass.dart'
    as _i5;
import 'package:bionic_book_reader/pages/main_page/main_page.dart' as _i2;
import 'package:bionic_book_reader/pages/view_bionic_text_page.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ViewBionicTextPage.name: (routeData) {
      final args = routeData.argsAs<ViewBionicTextPageArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ViewBionicTextPage(
          key: args.key,
          textToProcessCallbackFunc: args.textToProcessCallbackFunc,
          tabClass: args.tabClass,
        ),
      );
    },
    MainPage.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ViewBionicTextPage]
class ViewBionicTextPage extends _i3.PageRouteInfo<ViewBionicTextPageArgs> {
  ViewBionicTextPage({
    _i4.Key? key,
    required dynamic Function(String) textToProcessCallbackFunc,
    required _i5.TabClass tabClass,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ViewBionicTextPage.name,
          args: ViewBionicTextPageArgs(
            key: key,
            textToProcessCallbackFunc: textToProcessCallbackFunc,
            tabClass: tabClass,
          ),
          initialChildren: children,
        );

  static const String name = 'ViewBionicTextPage';

  static const _i3.PageInfo<ViewBionicTextPageArgs> page =
      _i3.PageInfo<ViewBionicTextPageArgs>(name);
}

class ViewBionicTextPageArgs {
  const ViewBionicTextPageArgs({
    this.key,
    required this.textToProcessCallbackFunc,
    required this.tabClass,
  });

  final _i4.Key? key;

  final dynamic Function(String) textToProcessCallbackFunc;

  final _i5.TabClass tabClass;

  @override
  String toString() {
    return 'ViewBionicTextPageArgs{key: $key, textToProcessCallbackFunc: $textToProcessCallbackFunc, tabClass: $tabClass}';
  }
}

/// generated route for
/// [_i2.MainPage]
class MainPage extends _i3.PageRouteInfo<void> {
  const MainPage({List<_i3.PageRouteInfo>? children})
      : super(
          MainPage.name,
          initialChildren: children,
        );

  static const String name = 'MainPage';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
