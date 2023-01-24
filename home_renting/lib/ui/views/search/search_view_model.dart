import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BasedViewModel {
  final _navigationService = locator<NavigationService>();
  final _firestoreService = locator<FireStoreService>();
  List<Property> _properties = [];
  List<Property> get properties => _properties;

  Future<void> onSearch(String query) async {
    if (_properties.isNotEmpty) {
      _properties = _properties
          .where((element) =>
              element.numberOfBathroom.toLowerCase().contains(query))
          .toList();
    } else {
      listenToProperty(query);
    }
  }

  void listenToProperty(String query) {
    setBusy(true);
    _firestoreService.listenToPropertyRealTime().listen((properties) {
      _properties = properties;
      onSearch(query);
      setBusy(false);
    });
  }

  void navigateToDetailView(Property property) {
    _navigationService.navigateTo(
      Routes.detailView,
    arguments: DetailViewArguments(property: property)
    );
  }
}
