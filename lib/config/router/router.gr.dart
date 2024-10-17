// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:keep_fit/features/auth/presentation/view/auth_navigation_screen.dart'
    as _i1;
import 'package:keep_fit/features/auth/presentation/view/auth_screen.dart'
    as _i2;
import 'package:keep_fit/features/auth/presentation/view/sign_in_screen.dart'
    as _i6;
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart'
    as _i10;
import 'package:keep_fit/features/diary/presentation/view/diary_screen.dart'
    as _i3;
import 'package:keep_fit/features/diary/presentation/widgets/product_page_widget.dart'
    as _i5;
import 'package:keep_fit/features/main/presentation/view/home_screen.dart'
    as _i4;
import 'package:keep_fit/features/weight/presentation/view/weight_screen.dart'
    as _i7;

/// generated route for
/// [_i1.AuthNavigationScreen]
class AuthNavigationRoute extends _i8.PageRouteInfo<void> {
  const AuthNavigationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthNavigationRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthNavigationScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i8.PageRouteInfo<void> {
  const AuthRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthScreen();
    },
  );
}

/// generated route for
/// [_i3.DiaryScreen]
class DiaryRoute extends _i8.PageRouteInfo<void> {
  const DiaryRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.DiaryScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
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

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ProductPageWidget]
class ProductRouteWidget extends _i8.PageRouteInfo<ProductRouteWidgetArgs> {
  ProductRouteWidget({
    _i9.Key? key,
    required List<_i10.IngredientUserEntity> ingredients,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ProductRouteWidget.name,
          args: ProductRouteWidgetArgs(
            key: key,
            ingredients: ingredients,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRouteWidget';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteWidgetArgs>();
      return _i5.ProductPageWidget(
        key: args.key,
        ingredients: args.ingredients,
      );
    },
  );
}

class ProductRouteWidgetArgs {
  const ProductRouteWidgetArgs({
    this.key,
    required this.ingredients,
  });

  final _i9.Key? key;

  final List<_i10.IngredientUserEntity> ingredients;

  @override
  String toString() {
    return 'ProductRouteWidgetArgs{key: $key, ingredients: $ingredients}';
  }
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignInScreen();
    },
  );
}

/// generated route for
/// [_i7.WeightScreen]
class WeightRoute extends _i8.PageRouteInfo<void> {
  const WeightRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WeightRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.WeightScreen();
    },
  );
}
