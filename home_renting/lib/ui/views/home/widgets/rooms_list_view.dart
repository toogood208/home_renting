part of '../home_view.dart';

class RoomsListViewWidget extends ViewModelWidget<HomeViewModel> {
  const RoomsListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return SizedBox(
      width: 305,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: viewModel.homes.length,
          separatorBuilder: (context, index) =>
              const Padding(padding: EdgeInsets.all(8)),
          itemBuilder: (context, index) {
            final home = viewModel.homes[index];
            return GestureDetector(
              onTap: () => viewModel.navigateToDetailView(home),
              child: Row(
                children: [
                  Container(
                    width: 74,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(home.image), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        home.name,
                        style: nearYouTextStyle,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${home.price}/year",
                        style: priceTextStyle,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.king_bed_outlined,
                                color: kHintSearchColor,
                              ),
                              Text(
                                "${home.numberOfBedrooms} Bedroom",
                                style: searchHintTextStyle,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.bathroom_outlined,
                                color: kHintSearchColor,
                              ),
                              Text(
                                "${home.numberOfBathroom} Bathroom",
                                style: searchHintTextStyle,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
