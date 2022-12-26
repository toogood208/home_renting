import 'package:home_renting/core/services/home_service.dart';
import 'package:home_renting/ui/views/detail/detail_view.dart';
import 'package:home_renting/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: Home, initial: true),
  AdaptiveRoute(page: DetailView)
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: HomeService)
], logger: StackedLogger())
class App {}
