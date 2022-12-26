class HomeModel {
  int id;
  String image;
  String name;
  String type;
  String location;
  String owner;
  bool isAvalable;
  String address;
  String price;
  String numberOfBedrooms;
  String numberOfBathroom;

  HomeModel({
    required this.id,
    required this.image,
    required this.name,
    required this.type,
    required this.location,
    required this.owner,
    required this.isAvalable,
    required this.address,
    required this.price,
    required this.numberOfBedrooms,
    required this.numberOfBathroom,
  });
}
