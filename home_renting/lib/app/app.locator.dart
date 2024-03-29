// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../core/services/api_service.dart';
import '../core/services/authentication_service.dart';
import '../core/services/cloud_storage_service.dart';
import '../core/services/firestore_service.dart';
import '../core/services/image_selector_service.dart';
import '../core/services/shared_preferences.dart';
import '../core/services/social_share_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => ImageSelectorservice());
  locator.registerLazySingleton(() => SocialShareService());
  locator.registerLazySingleton(() => ApiService());
  final sharedPreferencesService = await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPreferencesService);

  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FireStoreService());
  locator.registerLazySingleton(() => CloudStorageService());
}
