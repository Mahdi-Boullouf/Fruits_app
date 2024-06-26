import 'package:auto_route/annotations.dart';
// ignore: implementation_imports
import 'package:auto_route/src/route/auto_route_config.dart';
import 'package:fruit_animations_app/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter{
  @override

  List<AutoRoute> get routes =>[
    AutoRoute(page: SplashRoute.page,initial: true),
    AutoRoute(page: LoginRoute.page,),
    AutoRoute(page: ProductDetailsRoute.page,),
AutoRoute(page: DashboardRoute.page,
children: [
    AutoRoute(page: HomeRoute.page,),
AutoRoute(page: CartRoute.page),
AutoRoute(page: ProfileRoute.page)
]
),
    AutoRoute(page: RegisterRoute.page,),
    AutoRoute(page: CheckoutRoute.page)

  ];

}