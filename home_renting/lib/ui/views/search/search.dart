import 'package:flutter/material.dart';
import 'package:home_renting/core/models/property.dart';
import 'package:home_renting/ui/views/search/search_view_model.dart';
import 'package:home_renting/ui/widgets/app_spinner.dart';
import 'package:home_renting/ui/widgets/property_card.dart';
import 'package:stacked/stacked.dart';

class PropertySearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => SearchViewModel()),
      onViewModelReady: (model) => model.listenToProperty(query),
      builder: ((context, model, child) {
        return model.isBusy
            ? const Center(child: AppSpinner())
            : model.properties.isEmpty
                ? const Center(child: EmptyServerWidget())
                : const ServerListNotEmpty();
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: (() => SearchViewModel()),
      onViewModelReady: (model) => model.listenToProperty(query),
      builder: ((context, model, child) {
        final suggestions1 = model.properties;
        final suggestions = query.isEmpty
            ? model.properties
            : suggestions1
                .where((element) =>
                    element.location.toLowerCase().contains(query) ||
                    element.numberOfBedrooms
                        .toString()
                        .toLowerCase()
                        .contains(query) ||
                    element.numberOfBathroom
                        .toString()
                        .toLowerCase()
                        .contains(query) ||
                    element.price.toString().toLowerCase().contains(query))
                .toList();

        return suggestions.isEmpty
            ? const Center(child: Text('No results found'))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: suggestions.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 40.0),
                  itemBuilder: (context, index) {
                    Property property = suggestions[index];
                    return PropertyCard(
                      property: property,
                      onTap: () => model.navigateToDetailView(property),
                    );
                  },
                ),
              );
      }),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
        primaryTextTheme: theme.textTheme,
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
        ),);
  }
}

class ServerListNotEmpty extends ViewModelWidget<SearchViewModel> {
  const ServerListNotEmpty({super.key});

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: viewModel.properties.length,
        itemBuilder: (context, index) {
          Property property = viewModel.properties[index];
          return PropertyCard(property: property,onTap: () => viewModel.navigateToDetailView(property),);
        },
      ),
    );
  }
}

class EmptyServerWidget extends StatelessWidget {
  const EmptyServerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'You do not have any servers with this name yet',
      ),
    );
  }
}
