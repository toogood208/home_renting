import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/app/app.router.dart';
import 'package:home_renting/core/constants/constants.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/ui/base_view_model.dart';

import 'package:stacked_services/stacked_services.dart';

class  HomeViewModel extends BasedViewModel {
  final _navigationService = locator<NavigationService>();
  final FireStoreService _firestoreService = locator<FireStoreService>();
  final _log = getLogger("HomeViewModel");
  int selectedTypeindex = 0;
  int _selectedCategoryIndex = -1;

  List<Property> _properties = [];
  List<Property> get properties => _properties;

  List<Property> _topRents = [];
  List<Property> get topRents => _topRents;

  HomeViewModel() {
    listenToProperty();
  }
  String choice = categories[0];

  void selectChips(bool value, int index) {
    if (value) {
      _selectedCategoryIndex = index;
      selectedTypeindex = index;
      choice = categories[selectedTypeindex];
      listenToProperty();
    }
  }

  void listenToProperty() {
    setBusy(true);
    _firestoreService.listenToPropertyRealTime().listen((properties) {
      _properties = _selectedCategoryIndex > 0
          ? properties.where((property) {
              return property.type == choice;
            }).toList()
          : properties;
      _topRents = properties
          .where(
            (property) => property.showInTopRents == true,
          )
          .toList();
      setBusy(false);
       _log.v(properties);
    });
   
  }

  void navigateToCreateproperty() {
    _navigationService.navigateTo(Routes.propertyListView);
  }

  void navigateToDetailView(Property home) {
    _navigationService.navigateTo(Routes.detailView,
        arguments: DetailViewArguments(property: home));
  }
}
