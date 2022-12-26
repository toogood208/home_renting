import 'package:flutter/material.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/home/home_view_model.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/custom_search_widget.dart';
import 'package:home_renting/ui/widgets/home_categories_widget.dart';
import 'package:home_renting/ui/widgets/near_you.dart';
import 'package:stacked/stacked.dart';

part 'widgets/housee_near_you.dart';
part 'widgets/rooms_list_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: kappBackgeroundColor,
        appBar: const CustomAppBar(
          title: "Lagos",
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomSearchWidget(),
              SizedBox(height: 20),
              HomeCategories(),
              SizedBox(height: 27),
              NearYouWidget(title: "Top Rents"),
              SizedBox(height: 24),
              HousesNearYouWidget(),
              SizedBox(height: 32),
              NearYouWidget(title: "Best For You"),
              SizedBox(height: 24),
              RoomsListViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}