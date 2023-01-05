part of '../property_list_view.dart';

class PropertyListViewWidget extends ViewModelWidget<PropertyListViewModel> {
  const PropertyListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        shrinkWrap: true,
        itemCount: viewModel.properties.length, //model.properties.length,
        separatorBuilder: (context, index) =>
            const Padding(padding: EdgeInsets.all(8)),
        itemBuilder: (context, index) {
          final home = viewModel.properties[index];
          return InkWell(
            onTap: () {},
            child: Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    backgroundColor: primaryColor.shade50,
                    foregroundColor: primaryColor.shade600,
                    icon: Icons.edit,
                    onPressed: (context) => viewModel.editProperty(index),
                  ),
                  SlidableAction(
                    backgroundColor: errorColor.shade50,
                    foregroundColor: errorColor.shade600,
                    icon: Icons.delete,
                    onPressed: (context) => viewModel.deleteProperty(index),
                  ),
                ],
              ),
              child: PropertyCard(
                property: home,
                onTap: () =>
                  viewModel.naviagetToDetailPropertyView(index),
                
              ),
            ),
          );
        });
  }
}
