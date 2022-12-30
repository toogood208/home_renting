import 'package:home_renting/core/models/home_model.dart';

class HomeService {
  List<HomeModel> getHomes() {
    final homes = [
      HomeModel(
        description: "",
        id: "1",
        image: "assets/images/house1.jpg",
        name: "Cubana Villa",
        type: "Duplex",
        location: "Lagos",
        owner: "Darlignton Onwukwe",
        isAvalable: "yes",
        address: "3,Ife Street",
        price: "1,500,000",
        numberOfBathroom: "4",
        numberOfBedrooms: "3",
      ),
      HomeModel(
        description: "",
        id: "2",
        image: "assets/images/house2.jpg",
        name: "Ayo nio House",
        type: "Self Contain",
        location: "Lagos",
        owner: "Darlignton Onwukwe",
        isAvalable: "yes",
        address: "9, Tango Street Lagos",
        price: "400,000",
        numberOfBathroom: '2',
        numberOfBedrooms: "1",
      ),
      HomeModel(
          description: "",
          id: "3",
          image: "assets/images/house3.jpg",
          name: "Dundee Street 5",
          type: "Self Contain",
          location: "Abuja",
          owner: "Utunu",
          isAvalable: "no",
          address: "block 3, Street 5, Dundee Estate",
          price: "200,000",
          numberOfBathroom: "2",
          numberOfBedrooms: "1"),
      HomeModel(
        description: "",
        id: "4",
        image: "assets/images/house4.jpg",
        name: "Atamah Compound",
        type: "A room and palour self contain",
        location: "PH",
        owner: "Utunu",
        isAvalable: "no",
        address: "6,Dickson Street, RumuIgbo",
        price: "600,000",
        numberOfBathroom: "3",
        numberOfBedrooms: "2",
      ),
      HomeModel(
        id: "5",
        image: "assets/images/house5.jpg",
        name: "Alhaja lasisi house",
        type: "A room and palour self contain",
        location: "Ibadan",
        owner: "teg",
        isAvalable: 'yes',
        address: "15, Dickson Street, Bodijah, Ibandan",
        price: "500,000",
        numberOfBathroom: "2",
        numberOfBedrooms: "1",
        description: "",
      ),
    ];

    return homes;
  }
}
