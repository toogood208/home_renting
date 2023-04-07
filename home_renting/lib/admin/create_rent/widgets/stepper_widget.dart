import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/add_property_view_model.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/widgets/custom_dropdowm.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
import 'package:home_renting/ui/widgets/select_image_box.dart';
import 'package:stacked/stacked.dart';

class StepperWidget extends ViewModelWidget<AddPropertViewModel> {
  const StepperWidget(
      {super.key,
      required this.nameController,
      required this.locationController,
      required this.addressController,
      required this.descriptionController,
      required this.priceController,
      required this.bedroomController,
      required this.bathroomController});
  final TextEditingController nameController;
  final TextEditingController locationController;
  final TextEditingController addressController;
  final TextEditingController descriptionController;
  final TextEditingController priceController;
  final TextEditingController bedroomController;
  final TextEditingController bathroomController;

  @override
  Widget build(BuildContext context, AddPropertViewModel viewModel) {
    final steps = [
      CoolStep(
          title: "Banner Image",
          subtitle: "Provide a banner image for your property",
          content: SelectImageBoxWidget(
            selectImage: () => viewModel.selectImage(),
            selectedImage: viewModel.selectedImage,
          ),
          validation: () {
            return null;
          }),
      CoolStep(
        title: "Property Description",
        subtitle: "Enter property details",
        content: Column(children: [
          CustomTextField(
            controller: nameController,
            title: "Enter Property Name",
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Show in Top Rents"),
              Checkbox(
                value: viewModel.checkBoxValue,
                onChanged: (value) => viewModel.toggleCheckBoxValue(value!),
              ),
            ],
          ),
          const SizedBox(height: 24),
          CustomDropdown(
            title: "Enter Property Type",
            categories: viewModel.categories,
            value: viewModel.selectCategory,
            onchanged: ((value) => viewModel.selectedRole(value!)),
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: locationController,
            title: "Enter Property Location",
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: 24),
          CustomDropdown(
            title: "Is This Property Still Available?",
            categories: viewModel.isAvailable,
            value: viewModel.selectedAvailability,
            onchanged: ((value) => viewModel.selectedAvailabilty(value!)),
          ),
        ]),
        validation: () => null,
      ),
      CoolStep(
        title: "Property Description II",
        subtitle: "Enter Property Description",
        content: Column(children: [
          CustomTextField(
            controller: addressController,
            title: "Enter Property Full Address",
            textInputType: TextInputType.streetAddress,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: descriptionController,
            title: "Enter Property Description",
            textInputType: TextInputType.multiline,
            maxlines: null,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: priceController,
            title: "Enter Property Price",
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: bedroomController,
            title: "Enter Number Of Bedrooms",
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: bathroomController,
            title: "Enter Number Of Bathrooms",
            textInputType: TextInputType.number,
          ),
        ]),
        validation: () => null,
      ),
    ];
    return CoolStepper(
      steps: steps,
      config: CoolStepperConfig(
        backText: "Previous",
        nextText: "Next",
        finalText: "Submit",
        titleTextStyle: appPropertyTitletextStyle,
        subtitleTextStyle: searchHintTextStyle,
        headerColor:  Colors.blue[50],
        icon: Icon(Icons.edit, color: Colors.blue[400],),
       
      ),
       onCompleted: ()=> viewModel.addProperty(
        name: nameController.text, 
        location: locationController.text, 
        address: addressController.text, 
        price: priceController.text, 
        numberOfBathroom: bathroomController.text, 
        numberOfBedrooms: bedroomController.text, 
        description: descriptionController.text));
  }
}
