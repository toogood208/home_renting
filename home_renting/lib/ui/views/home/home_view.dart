import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_renting/core/constants/constants.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/shared/text_styles.dart';
import 'package:home_renting/ui/views/home/home_view_model.dart';
import 'package:home_renting/ui/views/search/search.dart';
import 'package:home_renting/ui/widgets/app_spinner.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/empty_state.dart';
import 'package:home_renting/ui/widgets/property_card.dart';
import 'package:stacked/stacked.dart';

part 'widgets/housee_near_you.dart';
part 'widgets/rooms_list_view.dart';
part 'widgets/see_more.dart';
part 'widgets/home_categories_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => model.isBusy
          ? const Scaffold(
              body: Center(
                child: AppSpinner(),
              ),
            )
          : Scaffold(
              backgroundColor: kappBackgeroundColor,
              appBar: CustomAppBar(
                title: "Lease Property",
                actions: [
                  IconButton(
                    onPressed: () => showSearch(
                      context: context,
                      delegate: PropertySearch(),
                    ),
                    color: Colors.black,
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: model.isBusy
                    ? const Center(child: AppSpinner())
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          const HomeCategoryWidget(),
                          const SizedBox(height: 24),
                          model.properties.isEmpty
                              ? SizedBox(
                                height: 500.h,
                                child: EmptyStateWidget(
                                    appBarTitle: "Lease Property",
                                    mainBodyText: "Empty Portfolio",
                                    subBodyText:
                                        "You currently dont have any property in your portfolio",
                                    onTap: model.navigateToCreateproperty,
                                  ),
                              )
                              : const RoomsListViewWidget(),
                        ],
                      ),
              ),
            ),
    );
  }
}
