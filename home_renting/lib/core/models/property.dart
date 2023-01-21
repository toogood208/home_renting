class Property {
  String id;
  String imageUrl;
  String imageFilename;
  bool showInTopRents;
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
  String? docId;

  Property({
    required this.id,
    required this.imageUrl,
    required this.imageFilename,
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
    required this.showInTopRents,
    this.docId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'showInTopRents': showInTopRents,
      'imageFilename': imageFilename,
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

  static Property fromMap(Map<String, dynamic> map, String docId) {
    return Property(
      id: map['id'] ?? "",
      imageUrl: map['imageUrl'] ?? "",
      imageFilename: map['imageFilename'] ?? "",
      name: map['name'] ?? "",
      type: map['type'] ?? "",
      location: map['location'] ?? "",
      owner: map['owner'] ?? "",
      isAvalable: map['isAvailable'] ?? "",
      address: map['address'] ?? "",
      price: map['price'] ?? "",
      numberOfBedrooms: map['numberOfBedrooms'] ?? "",
      numberOfBathroom: map['numberOfBathroom'] ?? "",
      description: map['description'] ?? "",
      showInTopRents: map['showInTopRents'] ?? false,
      docId: docId,
    );
  }
}
