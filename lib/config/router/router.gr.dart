// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:keep_fit/features/auth/presentation/view/auth_screen.dart'
    as _i1;
import 'package:keep_fit/features/diary/presentation/view/diary_screen.dart'
    as _i2;
import 'package:keep_fit/features/main/presentation/view/home_screen.dart'
    as _i3;
import 'package:keep_fit/features/weight/presentation/view/weight_screen.dart'
    as _i4;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i5.PageRouteInfo<void> {
  const AuthRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.DiaryScreen]
class DiaryRoute extends _i5.PageRouteInfo<void> {
  const DiaryRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.DiaryScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.WeightScreen]
class WeightRoute extends _i5.PageRouteInfo<void> {
  const WeightRoute({List<_i5.PageRouteInfo>? children})
      : super(
          WeightRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.WeightScreen();
    },
  );
}
