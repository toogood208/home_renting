import 'package:flutter/material.dart';
import 'package:home_renting/core/models/home_model.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.home});
  final HomeModel home;

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
                background: Image.asset(
                  home.image!,
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
                              "The 3 level house that has a modern design, has a large pool and a garage that fits up to four cars... Show More", style: searchHintTextStyle,)
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
                                  home.owner,
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
                                    "NGN${home.price} / Year",
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
