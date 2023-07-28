// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:bionic_book_reader/pages/main_page/main_page.dart' as _i1;
import 'package:bionic_book_reader/pages/view_bionic_text_page.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    MainPage.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MainPage(),
      );
    },
    ViewBionicTextPage.name: (routeData) {
      final args = routeData.argsAs<ViewBionicTextPageArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ViewBionicTextPage(
          key: args.key,
          textToProcess: args.textToProcess,
          title: args.title,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.MainPage]
class MainPage extends _i3.PageRouteInfo<void> {
  const MainPage({List<_i3.PageRouteInfo>? children})
      : super(
          MainPage.name,
          initialChildren: children,
        );

  static const String name = 'MainPage';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ViewBionicTextPage]
class ViewBionicTextPage extends _i3.PageRouteInfo<ViewBionicTextPageArgs> {
  ViewBionicTextPage({
    _i4.Key? key,
    required String textToProcess,
    required String title,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ViewBionicTextPage.name,
          args: ViewBionicTextPageArgs(
            key: key,
            textToProcess: textToProcess,
            title: title,
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
    required this.textToProcess,
    required this.title,
  });

  final _i4.Key? key;

  final String textToProcess;

  final String title;

  @override
  String toString() {
    return 'ViewBionicTextPageArgs{key: $key, textToProcess: $textToProcess, title: $title}';
  }
}
