class BloodCarModel {
  String name;
  String image;
  String city;
  String address;
  String location;

  BloodCarModel({
    required this.name,
    required this.image,
    required this.address,
    required this.city,
    required this.location,
  });

  factory BloodCarModel.fromJson(json, int i) {
    return BloodCarModel(
      name: json["places"][i]["hospitalname"],
      image: json["places"][i]["image"],
      address: json["places"][i]["addres"],
      city: json["places"][i]["city"],
      location: json["places"][i]["location"],
    );
  }
}
