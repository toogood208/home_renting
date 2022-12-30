class HomeModel {
  String id;
  String? image;
  String name;
  String type;
  String location;
  String owner;
  String isAvalable;
  String address;
  String price;
  String numberOfBedrooms;
  String numberOfBathroom;
  String description;

  HomeModel({
    required this.id,
    this.image,
    required this.name,
    required this.type,
    required this.location,
    required this.owner,
    required this.isAvalable,
    required this.address,
    required this.price,
    required this.numberOfBedrooms,
    required this.numberOfBathroom,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'type': type,
      'location': location,
      'owner': owner,
      'isAvailable': isAvalable,
      'address': address,
      'price': price,
      'numberOfBedrooms': numberOfBedrooms,
      'numberOfBathroom': numberOfBathroom,
      'description': description,
    };
  }

  static HomeModel fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      type: map['type'],
      location: map['location'],
      owner: map['owner'],
      isAvalable: map['isAvailable'],
      address: map['address'],
      price: map['price'],
      numberOfBedrooms: map['numberOfBedrooms'],
      numberOfBathroom: map[' numberOfBathroom'],
      description: map['description']
    );
  }
}
