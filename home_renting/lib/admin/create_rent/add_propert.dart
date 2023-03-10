

import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/add_property_view_model.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:home_renting/ui/widgets/custom_dropdowm.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
import 'package:home_renting/ui/widgets/select_image_box.dart';
import 'package:stacked/stacked.dart';

class AddPropertView extends StatelessWidget {
  AddPropertView({super.key, this.property});
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
        model.selectedAvailability = property?.isAvalable ?? model.selectedAvailability;
        model.selectCategory = property?.type ?? "Duplex";
        model.checkBoxValue = property?.showInTopRents ?? model.checkBoxValue;

        if (property != null) {
          model.setEditIngProperty(property!);
        }
      },
      viewModelBuilder: () => AddPropertViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Add Property"),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stepper(
                type: StepperType.vertical,
                currentStep: model.currentStep ,
                onStepTapped: (step)=> model.tapped(step),
                onStepContinue: () =>model.continued(),
                onStepCancel:  model.stepCancel,
                steps: <Step>[
                  Step(title: const Text("Banner Image"),
                      content: Column(
                        children: [
                          SelectImageBoxWidget(
                            selectImage: () => model.selectImage(),
                            selectedImage: model.selectedImage,
                          ),
                        ]
                      ),
                    isActive: model.currentStep >= 0,
                    state: model.currentStep >= 0 ?
                    StepState.complete : StepState.disabled,),
                  Step(title: const Text("Property Description"),
                    content: Column(
                        children: [
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
                                value: model.checkBoxValue,
                                onChanged: (value) => model.toggleCheckBoxValue(value!),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          CustomDropdown(
                            title: "Enter Property Type",
                            categories: model.categories,
                            value: model.selectCategory,
                            onchanged: ((value) => model.selectedRole(value!)),
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
                            categories: model.isAvailable,
                            value: model.selectedAvailability,
                            onchanged: ((value) => model.selectedAvailabilty(value!)),
                          ),
                        ]
                    ),
                    isActive: model.currentStep >= 0,
                    state: model.currentStep >= 1 ?
                    StepState.complete : StepState.disabled,),
                  Step(title: const Text("Property Details"),
                    content: Column(
                        children: [
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
                        ]
                    ),
                    isActive: currentStep >= 0,
                    state: currentStep >= 2 ?
                    StepState.complete : StepState.disabled,),
                  Step(title: const Text("Submit"),
                    content:  CustomButton(
                      busy: model.isBusy,
                      title: "Add Property",
                      onTap: () {
                        model.addProperty(
                          name: nameController.text,
                          location: locationController.text,
                          address: addressController.text,
                          price: priceController.text,
                          numberOfBathroom: bathroomController.text,
                          numberOfBedrooms: bedroomController.text,
                          description: descriptionController.text,
                        );
                      },
                    ),
                    isActive: model.currentStep >= 0,
                    state: model.currentStep >= 3 ?
                    StepState.complete : StepState.disabled,),

                ],),
                /*Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 27),

                    const SizedBox(height: 24),

                    const SizedBox(height: 24),

                    const SizedBox(height: 24),
                   ,
                    const SizedBox(height: 24),
                  ],
                ),*/
              ),
            );


      },
    );
  }


}
