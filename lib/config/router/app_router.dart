import 'package:auto_route/annotations.dart';
// ignore: implementation_imports
import 'package:auto_route/src/route/auto_route_config.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override

  List<AutoRoute> get routes =>[
    AutoRoute(page: HomeRoute.page,initial: false),
    AutoRoute(page: SplashRoute.page,initial: false),
    AutoRoute(page: LoginRoute.page,initial: true),
    AutoRoute(page: RegisterRoute.page,initial: false),

  ];

}