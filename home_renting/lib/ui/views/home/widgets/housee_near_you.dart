part of '../home_view.dart';

class HousesNearYouWidget extends ViewModelWidget<HomeViewModel> {
  const HousesNearYouWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return SizedBox(
      height: 272,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.topRents.length,
        separatorBuilder: (context, index) =>
          index > 5? const SizedBox():  const Padding(padding: EdgeInsets.all(8)),
        itemBuilder: (context, index) {
          final home = viewModel.topRents[index];
          return GestureDetector(
            onTap: () => viewModel.navigateToDetailView(home),
            child: Stack(
              children: [
                Container(
                  width: 222,
                  height: 272,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(home.imageUrl),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.95), BlendMode.dstATop),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 10,
                      bottom: 4,
                      right: 8,
                    ),
                    width: 73,
                    height: 25,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        home.location,
                        style: categorySelectedStyle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 4,
                      left: 10,
                      bottom: 4,
                      right: 8,
                    ),
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          home.name,
                          style: dreamHouseTextStyle,
                        ),
                        Text(
                          home.address,
                          style: categorySelectedStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
