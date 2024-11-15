// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:keep_fit/features/auth/presentation/view/auth_navigation_screen.dart'
    as _i1;
import 'package:keep_fit/features/auth/presentation/view/auth_screen.dart'
    as _i2;
import 'package:keep_fit/features/auth/presentation/view/sign_in_screen.dart'
    as _i7;
import 'package:keep_fit/features/diary/domain/entities/ingredient_user_entity.dart'
    as _i11;
import 'package:keep_fit/features/diary/presentation/bloc/bloc/meal_bloc/meals_bloc_bloc.dart'
    as _i12;
import 'package:keep_fit/features/diary/presentation/view/diary_screen.dart'
    as _i3;
import 'package:keep_fit/features/diary/presentation/widgets/product_page_widget.dart'
    as _i5;
import 'package:keep_fit/features/main/presentation/view/home_screen.dart'
    as _i4;
import 'package:keep_fit/features/profile/presentation/view/profile_screen.dart'
    as _i6;
import 'package:keep_fit/features/weight/presentation/view/weight_screen.dart'
    as _i8;

/// generated route for
/// [_i1.AuthNavigationScreen]
class AuthNavigationRoute extends _i9.PageRouteInfo<void> {
  const AuthNavigationRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthNavigationRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthNavigationScreen();
    },
  );
}

/// generated route for
/// [_i2.AuthScreen]
class AuthRoute extends _i9.PageRouteInfo<void> {
  const AuthRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.AuthScreen();
    },
  );
}

/// generated route for
/// [_i3.DiaryScreen]
class DiaryRoute extends _i9.PageRouteInfo<void> {
  const DiaryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiaryRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.DiaryScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
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

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.ProductPageWidget]
class ProductRouteWidget extends _i9.PageRouteInfo<ProductRouteWidgetArgs> {
  ProductRouteWidget({
    _i10.Key? key,
    required List<_i11.IngredientUserEntity> ingredients,
    required _i12.MealsBlocBloc valueBloc,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ProductRouteWidget.name,
          args: ProductRouteWidgetArgs(
            key: key,
            ingredients: ingredients,
            valueBloc: valueBloc,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductRouteWidget';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductRouteWidgetArgs>();
      return _i5.ProductPageWidget(
        key: args.key,
        ingredients: args.ingredients,
        valueBloc: args.valueBloc,
      );
    },
  );
}

class ProductRouteWidgetArgs {
  const ProductRouteWidgetArgs({
    this.key,
    required this.ingredients,
    required this.valueBloc,
  });

  final _i10.Key? key;

  final List<_i11.IngredientUserEntity> ingredients;

  final _i12.MealsBlocBloc valueBloc;

  @override
  String toString() {
    return 'ProductRouteWidgetArgs{key: $key, ingredients: $ingredients, valueBloc: $valueBloc}';
  }
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i9.PageRouteInfo<void> {
  const ProfileRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.SignInScreen]
class SignInRoute extends _i9.PageRouteInfo<void> {
  const SignInRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignInScreen();
    },
  );
}

/// generated route for
/// [_i8.WeightScreen]
class WeightRoute extends _i9.PageRouteInfo<void> {
  const WeightRoute({List<_i9.PageRouteInfo>? children})
      : super(
          WeightRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeightRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.WeightScreen();
    },
  );
}
