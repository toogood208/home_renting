// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/add_propert.dart' as _i7;
import 'package:home_renting/admin/property_list/property_list_view.dart'
    as _i8;
import 'package:home_renting/core/models/property.dart' as _i10;
import 'package:home_renting/ui/views/detail/detail_view.dart' as _i6;
import 'package:home_renting/ui/views/home/home_view.dart' as _i5;
import 'package:home_renting/ui/views/login/login_view.dart' as _i3;
import 'package:home_renting/ui/views/signup/signup_view.dart' as _i4;
import 'package:home_renting/ui/views/startup_view/startup_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i11;

class Routes {
  static const startUpView = '/';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const home = '/Home';

  static const detailView = '/detail-view';

  static const addPropertView = '/add-propert-view';

  static const propertyListView = '/property-list-view';

  static const all = <String>{
    startUpView,
    loginView,
    signupView,
    home,
    detailView,
    addPropertView,
    propertyListView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startUpView,
      page: _i2.StartUpView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i3.LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: _i4.SignupView,
    ),
    _i1.RouteDef(
      Routes.home,
      page: _i5.Home,
    ),
    _i1.RouteDef(
      Routes.detailView,
      page: _i6.DetailView,
    ),
    _i1.RouteDef(
      Routes.addPropertView,
      page: _i7.AddPropertView,
    ),
    _i1.RouteDef(
      Routes.propertyListView,
      page: _i8.PropertyListView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartUpView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i2.StartUpView(),
        settings: data,
      );
    },
    _i3.LoginView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i3.LoginView(),
        settings: data,
      );
    },
    _i4.SignupView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i4.SignupView(),
        settings: data,
      );
    },
    _i5.Home: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i5.Home(),
        settings: data,
      );
    },
    _i6.DetailView: (data) {
      final args = data.getArgs<DetailViewArguments>(nullOk: false);
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i6.DetailView(key: args.key, property: args.property),
        settings: data,
      );
    },
    _i7.AddPropertView: (data) {
      final args = data.getArgs<AddPropertViewArguments>(
        orElse: () => const AddPropertViewArguments(),
      );
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) =>
            _i7.AddPropertView(key: args.key, property: args.property),
        settings: data,
      );
    },
    _i8.PropertyListView: (data) {
      return _i1.buildAdaptivePageRoute<dynamic>(
        builder: (context) => const _i8.PropertyListView(),
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
    required this.property,
  });

  final _i9.Key? key;

  final _i10.Property property;
}

class AddPropertViewArguments {
  const AddPropertViewArguments({
    this.key,
    this.property,
  });

  final _i9.Key? key;

  final _i10.Property? property;
}

extension NavigatorStateExtension on _i11.NavigationService {
  Future<dynamic> navigateToStartUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

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
    _i9.Key? key,
    required _i10.Property property,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailView,
        arguments: DetailViewArguments(key: key, property: property),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddPropertView({
    _i9.Key? key,
    _i10.Property? property,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.addPropertView,
        arguments: AddPropertViewArguments(key: key, property: property),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPropertyListView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.propertyListView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
