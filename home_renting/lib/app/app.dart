import 'package:home_renting/admin/create_rent/add_propert.dart';
import 'package:home_renting/admin/property_list/property_list_view.dart';
import 'package:home_renting/core/services/authentication_service.dart';
import 'package:home_renting/core/services/cloud_storage_service.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/core/services/home_service.dart';
import 'package:home_renting/core/services/image_selector_service.dart';
import 'package:home_renting/core/services/social_share_service.dart';
import 'package:home_renting/ui/views/detail/detail_view.dart';
import 'package:home_renting/ui/views/home/home_view.dart';
import 'package:home_renting/ui/views/login/login_view.dart';
import 'package:home_renting/ui/views/signup/signup_view.dart';
import 'package:home_renting/ui/views/startup_view/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: StartUpView, initial: true),
  AdaptiveRoute(page: LoginView),
  AdaptiveRoute(page: SignupView),
  AdaptiveRoute(page: Home),
  AdaptiveRoute(page: DetailView),
  AdaptiveRoute(page: AddPropertView),
  AdaptiveRoute(page: PropertyListView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: HomeService),
  LazySingleton(classType: DialogService),

  // Utils
  LazySingleton(classType: ImageSelectorservice),
  LazySingleton(classType: SocialShareService),

  //Firebase Services
  LazySingleton(classType: AuthenticationService),
  LazySingleton(classType: FireStoreService),
  LazySingleton(classType: CloudStorageService),
], logger: StackedLogger())
class App {}
