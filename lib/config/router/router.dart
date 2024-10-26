import 'package:auto_route/auto_route.dart';
import 'package:keep_fit/config/router/guards/auth_guard.dart';
import 'package:keep_fit/config/router/router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter{
  @override
  // TODO: implement routes
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/', children: [
      AutoRoute(page: DiaryRoute.page, path: 'diary'),
      AutoRoute(page: WeightRoute.page, path: 'weight'),
      AutoRoute(page: AuthNavigationRoute.page, initial: true, path: 'navigation', children: [
        AutoRoute(page: AuthRoute.page, path: 'signup', initial: true),
        AutoRoute(page: SignInRoute.page, path: 'signin')
      ]),
      AutoRoute(page: ProfileRoute.page, path: 'profile')
    ]),
    AutoRoute(page: ProductRouteWidget.page, path: '/')
  ];

}
