import 'package:blood/styles/Colors.dart';

class BloodRequestModel {
  final String? image;
  final String? name;
  final String? phoneNumber;
  final String? bloodType;
  final String? cityName;
  final String message;

  const BloodRequestModel({
    required this.name,
    required this.phoneNumber,
    required this.bloodType,
    required this.cityName,
    required this.image,
    required this.message,
  });

  factory BloodRequestModel.fromJson(json, int i) {
    return BloodRequestModel(
      name: json["donors"][i]["name"],
      phoneNumber: json["donors"][i]["phone"],
      bloodType: json["donors"][i]["bloodType"],
      cityName: json["donors"][i]["city"],
      image: json["donors"][i]["profileImg"],
      message: json["donors"][i]["message"],
    );
  }
}
