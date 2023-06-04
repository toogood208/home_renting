import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/core/services/social_share_service.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/detail/detail_view_model.dart';
import 'package:home_renting/ui/widgets/app_spinner.dart';
import 'package:home_renting/ui/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.property});
  final Property property;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
      viewModelBuilder: () => DetailViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kappBackgeroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(
                  imageUrl: property.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: model.isBusy
                    ? const Center(
                        child: AppSpinner(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          SizedBox(
                            width: 335,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: nearYouTextStyle,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  property.description,
                                  style: searchHintTextStyle,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Utilities",
                                style: nearYouTextStyle,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${property.numberOfBedrooms} Bedroom(s)",
                                    style: searchHintTextStyle,
                                  ),
                                  Text(
                                    "${property.numberOfBathroom} Bathroom(s)",
                                    style: searchHintTextStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 32),
                          Text(
                            "Share",
                            style: nearYouTextStyle,
                          ),
                          const SizedBox(height: 20),
                          IconButton(
                            onPressed: () {
                              model.socialShare(
                                share: Shares.shareAll,
                                property: property,
                              );
                            },
                            icon: const FaIcon(
                              Icons.share_sharp,
                              color: Colors.purpleAccent,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Price",
                                style: nearYouTextStyle,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                "NGN${property.price} / Year",
                                style: searchHintTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          CustomButton(
                            busy: model.isBusy,
                            title: "Rent",
                            onTap: () {
                              model.updateProperty(property);
                            },
                          ),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
