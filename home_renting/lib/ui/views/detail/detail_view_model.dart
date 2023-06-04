import 'package:home_renting/app/app.locator.dart';
import 'package:home_renting/app/app.logger.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/firestore_service.dart';
import 'package:home_renting/core/services/social_share_service.dart';
import 'package:home_renting/ui/base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class DetailViewModel extends BasedViewModel {
  final _socialService = locator<SocialShareService>();
  final _firestoreService = locator<FireStoreService>();
  final _dialogservice = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  final log = getLogger("DetailViewModel");

  void socialShare({required Shares share, required Property property}){
    setBusy(true);
    _socialService.tapShare(
      share: share, property: property,);
    setBusy(false);
  }

  Future updateProperty(Property property) async {
    setBusy(true);
    final dynamic response;

    response = await _firestoreService.updateProperty(Property(
      id: property.id,
      name: property.name,
      imageUrl: property.imageUrl,
      imageFilename: property.imageFilename,
      type: property.type,
      location: property.location,
      owner: currentUser.fullname,
      isAvalable: "no",
      address: property.address,
      price: property.price,
      numberOfBedrooms: property.numberOfBedrooms,
      numberOfBathroom: property.numberOfBathroom,
      description: property.description,
      docId: property.docId,
      showInTopRents: property.showInTopRents,
    ));

    setBusy(false);
    if (response is String) {
      await _dialogservice.showDialog(
        title: "Could not add property",
        description: response,
      );
      log.d(response);
    } else {
      await _dialogservice.showDialog(
        title: "Property Updated Succesfully",
        description: "Your Property Has Been Updated",
      );
    }
    _navigationService.popRepeated(1);
  }
}
