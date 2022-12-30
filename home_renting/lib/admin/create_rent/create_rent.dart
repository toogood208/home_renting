import 'package:flutter/material.dart';
import 'package:home_renting/admin/create_rent/create_rent_view_nodel.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:home_renting/ui/widgets/custom_dropdowm.dart';
import 'package:home_renting/ui/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';

class CreateRentView extends StatelessWidget {
  const CreateRentView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateRentViewModel>.reactive(
      viewModelBuilder: () => CreateRentViewModel(),
      builder: (context, model, child) {
        TextEditingController nameController = TextEditingController();
        TextEditingController locationController = TextEditingController();
        TextEditingController descriptionController = TextEditingController();
        TextEditingController addressController = TextEditingController();
        TextEditingController priceController = TextEditingController();
        TextEditingController bedroomController = TextEditingController();
        TextEditingController bathroomController = TextEditingController();
        return Scaffold(
          appBar: const CustomAppBar(title: "Add Rents"),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 27),
                CustomButton(
                  title: "Upload Hero Banner",
                  onTap: () {},
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
                  value: model.selectRole,
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
