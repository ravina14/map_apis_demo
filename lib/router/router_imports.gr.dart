// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:map_apis_demo/data/models/place_model.dart' as _i7;
import 'package:map_apis_demo/screen/login/login_imports.dart' as _i1;
import 'package:map_apis_demo/screen/place_detail/place_detail_import.dart'
    as _i2;
import 'package:map_apis_demo/screen/place_list/place_list_import.dart' as _i3;
import 'package:map_apis_demo/screen/splash/splash_imports.dart' as _i4;

/// generated route for
/// [_i1.Login]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.Login();
    },
  );
}

/// generated route for
/// [_i2.PlaceDetail]
class PlaceDetailRoute extends _i5.PageRouteInfo<PlaceDetailRouteArgs> {
  PlaceDetailRoute({
    _i6.Key? key,
    required _i7.Result result,
    required String currentLocation,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          PlaceDetailRoute.name,
          args: PlaceDetailRouteArgs(
            key: key,
            result: result,
            currentLocation: currentLocation,
          ),
          initialChildren: children,
        );

  static const String name = 'PlaceDetailRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PlaceDetailRouteArgs>();
      return _i2.PlaceDetail(
        key: args.key,
        result: args.result,
        currentLocation: args.currentLocation,
      );
    },
  );
}

class PlaceDetailRouteArgs {
  const PlaceDetailRouteArgs({
    this.key,
    required this.result,
    required this.currentLocation,
  });

  final _i6.Key? key;

  final _i7.Result result;

  final String currentLocation;

  @override
  String toString() {
    return 'PlaceDetailRouteArgs{key: $key, result: $result, currentLocation: $currentLocation}';
  }
}

/// generated route for
/// [_i3.PlaceList]
class PlaceListRoute extends _i5.PageRouteInfo<void> {
  const PlaceListRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PlaceListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceListRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.PlaceList();
    },
  );
}

/// generated route for
/// [_i4.Splash]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.Splash();
    },
  );
}
