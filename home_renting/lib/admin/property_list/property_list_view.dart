import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:home_renting/admin/property_list/property_list_view_model.dart';
import 'package:home_renting/ui/shared/colors.dart';
import 'package:home_renting/ui/widgets/custom_appbar.dart';
import 'package:home_renting/ui/widgets/property_card.dart';
import 'package:stacked/stacked.dart';

part 'widgets/property_list_view_widget.dart';



class PropertyListView extends StatelessWidget {
  const PropertyListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PropertyListViewModel>.reactive(
      onViewModelReady: (model) => model.listenToProperty(),
      viewModelBuilder: () => PropertyListViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: const CustomAppBar(title: "Your Properties"),
          body: const PropertyListViewWidget(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.naviagetToAddPropertyView();
             
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

 
}
