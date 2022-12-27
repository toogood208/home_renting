// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:home_renting/core/models/home_model.dart' as _i7;
import 'package:home_renting/ui/views/detail/detail_view.dart' as _i5;
import 'package:home_renting/ui/views/home/home_view.dart' as _i4;
import 'package:home_renting/ui/views/login/login_view.dart' as _i2;
import 'package:home_renting/ui/views/signup/signup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i8;

class Routes {
  static const loginView = '/';

  static const signupView = '/signup-view';

  static const home = '/Home';

  static const detailView = '/detail-view';

  static const all = <String>{
    loginView,
    signupView,
    home,
    detailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i3.SignupView,
    ),
    _i1.RouteDef(
      Routes.home,
      page: _i4.Home,
    ),
    _i1.RouteDef(
      Routes.detailView,
      page: _i5.DetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.SignupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.SignupView(),
        settings: data,
      );
    },
    _i4.Home: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.Home(),
        settings: data,
      );
    },
    _i5.DetailView: (data) {
      final args = data.getArgs<DetailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => _i5.DetailView(key: args.key, home: args.home),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class DetailViewArguments {
  const DetailViewArguments({
    this.key,
    required this.home,
  });

  final _i6.Key? key;

  final _i7.HomeModel home;
}

extension NavigatorStateExtension on _i8.NavigationService {
  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHome([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.home,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailView({
    _i6.Key? key,
    required _i7.HomeModel home,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailView,
        arguments: DetailViewArguments(key: key, home: home),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
