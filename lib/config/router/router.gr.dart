// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:keep_fit/features/auth/presentation/view/auth_navigation_screen.dart'
    as _i1;
import 'package:keep_fit/features/auth/presentation/view/auth_screen.dart'
    as _i2;
import 'package:keep_fit/features/auth/presentation/view/sign_in_screen.dart'
    as _i5;
import 'package:keep_fit/features/diary/presentation/view/diary_screen.dart'
    as _i3;
import 'package:keep_fit/features/main/presentation/view/home_screen.dart'
    as _i4;
import 'package:keep_fit/features/weight/presentation/view/weight_screen.dart'
    as _i6;

/// generated route for
/// [_i1.AuthNavigationScreen]
class AuthNavigationRoute extends _i7.PageRouteInfo<void> {
  const AuthNavigationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthNavigationRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthNavigationScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthScreen();
    },
  );
}

/// generated route for
/// [_i3.DiaryScreen]
class DiaryRoute extends _i7.PageRouteInfo<void> {
  const DiaryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.DiaryScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i4.HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SignInScreen]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignInScreen();
    },
  );
}

/// generated route for
/// [_i6.WeightScreen]
class WeightRoute extends _i7.PageRouteInfo<void> {
  const WeightRoute({List<_i7.PageRouteInfo>? children})
      : super(
          WeightRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.WeightScreen();
    },
  );
}
