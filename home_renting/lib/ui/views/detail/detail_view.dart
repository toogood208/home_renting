import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.property});
  final Property property;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kappBackgeroundColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: CachedNetworkImage(       
                 imageUrl:  property.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
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
                             property.description, style: searchHintTextStyle,)
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: ownerBackgroundColor,
                                shape: BoxShape.circle,
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/owner.png"),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  property.owner,
                                  style: nearYouTextStyle,
                                ),
                                Text(
                                  "Agent",
                                  style: searchHintTextStyle,
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: ownerBackgroundColor,
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.whatsapp_outlined,
                              color: ownerBackgroundColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "Gallery",
                      style: nearYouTextStyle,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: ownerBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/house1.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: ownerBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/house2.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: ownerBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/house3.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Container(
                          width: 72,
                          height: 72,
                          decoration: BoxDecoration(
                            color: ownerBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/house4.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Stack(
                      children: [
                        Image.asset("assets/images/map.png"),
                        Positioned(
                          bottom: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "price",
                                    style: searchHintTextStyle,
                                  ),
                                  Text(
                                    "NGN${property.price} / Year",
                                    style: nearYouTextStyle,
                                  )
                                ],
                              ),
                              const SizedBox(width: 52),
                              Container(
                                height: 43,
                                width: 122,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      kcategoryBackgroundColor,
                                      priceColor,
                                    ],),
                                    borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text('Rent now',style: dreamHouseTextStyle,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
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
