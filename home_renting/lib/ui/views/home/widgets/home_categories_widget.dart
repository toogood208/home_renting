part of '../home_view.dart';

class HomeCategoryWidget extends ViewModelWidget<HomeViewModel> {
  const HomeCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final choice = categories[index];
                return Container(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: ChoiceChip(
                    label: Text(choice),
                    labelStyle: viewModel.selectedTypeindex == index
                        ? categorySelectedStyle
                        : searchHintTextStyle,
                    backgroundColor: kgreyColor,
                    selectedColor: kcategoryBackgroundColor,
                    selected: viewModel.selectedTypeindex == index,
                    onSelected: (value) {
                      viewModel.selectChips(value, index);
                    },
                  ),
                );
              }),
        ),
      ],
    );
  }
}
