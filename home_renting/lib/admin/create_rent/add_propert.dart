import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/add_property_view_model.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:home_renting/ui/widgets/custom_dropdowm.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
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
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddPropertViewModel>.reactive(
      onModelReady: (model) {
        nameController.text = property?.name ?? "";
        locationController.text = property?.location ?? "";
        descriptionController.text = property?.description ?? "";
        addressController.text = property?.address ?? "";
        priceController.text = property?.price ?? "";
        bedroomController.text = property?.numberOfBedrooms ?? "";
        bathroomController.text = property?.numberOfBathroom ?? "";
        model.selectedAvailability = property?.isAvalable ?? "yes";
        model.selectCategory = property?.type ?? "Shop";

        if (property != null) {
          model.setEditIngProperty(property!);
        }
      },
      viewModelBuilder: () => AddPropertViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Add Rents"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 27),
                GestureDetector(
                  // When we tap we call selectImage
                  onTap: () => model.selectImage(),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: model.selectedImage == null
                        ? Text(
                            'Tap to add post image',
                            style: TextStyle(color: Colors.grey[400]),
                          )
                        // If we have a selected image we want to show it
                        : Image.file(model.selectedImage!),
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: nameController,
                  title: "Enter Property Name",
                  textInputType: TextInputType.name,
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
                const SizedBox(height: 24),
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
                const SizedBox(height: 24),
                CustomButton(
                  busy: model.isBusy,
                  title: "Add Property",
                  onTap: () {
                    model.addProperty(
                      name: nameController.text,
                      location: locationController.text,
                      owner: "",
                      address: addressController.text,
                      price: priceController.text,
                      numberOfBathroom: bathroomController.text,
                      numberOfBedrooms: bedroomController.text,
                      description: descriptionController.text,
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}