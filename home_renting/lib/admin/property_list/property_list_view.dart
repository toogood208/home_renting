import 'package:flutter/material.dart';
import 'package:home_renting/admin/property_list/property_list_view_model.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:stacked/stacked.dart';

class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PropertyListViewModel>.reactive(
      onModelReady: (model) => model.listenToPosts(),
      viewModelBuilder: () => PropertyListViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Your Properties"),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: 305,
            child: ListView.separated(
                shrinkWrap: true,
                itemCount: model.properties.length,
                separatorBuilder: (context, index) =>
                    const Padding(padding: EdgeInsets.all(8)),
                itemBuilder: (context, index) {
                  final home = model.properties[index];
                  return GestureDetector(
                    onTap: () {
                      model.editPost(index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/images/house1.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              home.name,
                              style: nearYouTextStyle,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${home.price}/year",
                              style: priceTextStyle,
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.king_bed_outlined,
                                      color: kHintSearchColor,
                                    ),
                                    Text(
                                      home.numberOfBedrooms,
                                      style: searchHintTextStyle,
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.bathroom_outlined,
                                      color: kHintSearchColor,
                                    ),
                                    Text(
                                      home.numberOfBathroom,
                                      style: searchHintTextStyle,
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.naviagetToRentView();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
