import 'package:auto_route/auto_route.dart';
import 'package:bionic_book_reader/route/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route,Page')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ViewBionicTextPage.page),
        AutoRoute(page: MainPage.page, initial: true),
      ];
}
