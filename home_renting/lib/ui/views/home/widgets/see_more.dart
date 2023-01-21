part of '../home_view.dart';

class SeeMoreWidget extends ViewModelWidget<HomeViewModel> {
  const SeeMoreWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Scaffold(
      body: SizedBox(
        width: 305,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: viewModel.properties.length,
            separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.all(8)),
            itemBuilder: (context, index) {
              final property = viewModel.properties[index];
              return PropertyCard(property: property, onTap: () => viewModel.navigateToDetailView(property),);
            }),
      ),
    );
  }
}