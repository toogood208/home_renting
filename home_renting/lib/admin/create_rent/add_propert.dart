import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/widgets/stepper_widget.dart';
import 'package:home_renting/ui/widgets/app_spinner.dart';
import 'package:stacked/stacked.dart';
import 'package:home_renting/admin/create_rent/add_property_view_model.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';

class AddPropertView extends StatelessWidget {
  AddPropertView({
    Key? key,
    this.property,
  }) : super(key: key);
  final Property? property;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController bedroomController = TextEditingController();
  final TextEditingController bathroomController = TextEditingController();
  final currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPropertViewModel>.reactive(
      onViewModelReady: (model) {
        nameController.text = property?.name ?? "";
        locationController.text = property?.location ?? "";
        descriptionController.text = property?.description ?? "";
        addressController.text = property?.address ?? "";
        priceController.text = property?.price ?? "";
        bedroomController.text = property?.numberOfBedrooms ?? "";
        bathroomController.text = property?.numberOfBathroom ?? "";
        model.selectedAvailability =
            property?.isAvalable ?? model.selectedAvailability;
        model.selectCategory = property?.type ?? "Duplex";
        model.checkBoxValue = property?.showInTopRents ?? model.checkBoxValue;

        if (property != null) {
          model.setEditIngProperty(property!);
        }
      },
      viewModelBuilder: () => AddPropertViewModel(),
      builder: (context, model, child) {
        return model.isBusy ?
        const Scaffold(
          body: Center(
            child: AppSpinner(),
          ),
        ):
        Scaffold(
          appBar: const CustomAppBar(title: "Add Property"),
          body: StepperWidget(
            nameController: nameController,
            locationController: locationController,
            priceController: priceController,
            addressController: addressController,
            bedroomController: bedroomController,
            bathroomController: bathroomController,
            descriptionController: descriptionController,
          ),
        );
      },
    );
  }
}
