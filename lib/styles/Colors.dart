import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(31, 78, 104, 1);
const secondaryColor = Color.fromRGBO(121, 188, 215, 1);
const lightColor = Color.fromRGBO(207, 235, 247, 1);
String userName = '';
String userLastName = '';
String selectedCity = '';
String selectedBlood = '';
String requesterName = '';
String emailOfRequest = '';
String bloodUnits = '';
List<String> images = [
  'assets/Images/profile1.jpg',
  'assets/Images/profile2.jpg',
  'assets/Images/profile3.jpg',
  'assets/Images/profile4.jpg',
  'assets/Images/profile5.jpg',
];

class EgyptianGovernorate {
  final String nameAr;
  final String nameEn;

  EgyptianGovernorate({
    required this.nameAr,
    required this.nameEn,
  });
}

final egyptianGovernorates = [
  EgyptianGovernorate(nameAr: "القاهرة", nameEn: "Cairo"),
  EgyptianGovernorate(nameAr: "الإسكندرية", nameEn: "Alexandria"),
  EgyptianGovernorate(nameAr: "الجيزة", nameEn: "Giza"),
  EgyptianGovernorate(nameAr: "القليوبية", nameEn: "Qalyubia"),
  EgyptianGovernorate(nameAr: "بورسعيد", nameEn: "Port Said"),
  EgyptianGovernorate(nameAr: "السويس", nameEn: "Suez"),
  EgyptianGovernorate(nameAr: "أسوان", nameEn: "Aswan"),
  EgyptianGovernorate(nameAr: "أسيوط", nameEn: "Asyut"),
  EgyptianGovernorate(nameAr: "البحيرة", nameEn: "Beheira"),
  EgyptianGovernorate(nameAr: "بني سويف", nameEn: "Beni Suef"),
  EgyptianGovernorate(nameAr: "الدقهلية", nameEn: "Dakahlia"),
  EgyptianGovernorate(nameAr: "دمياط", nameEn: "Damietta"),
  EgyptianGovernorate(nameAr: "الفيوم", nameEn: "Faiyum"),
  EgyptianGovernorate(nameAr: "الغربية", nameEn: "Gharbia"),
  EgyptianGovernorate(nameAr: "الإسماعلية", nameEn: "Ismailia"),
  EgyptianGovernorate(nameAr: "كفر الشيخ", nameEn: "Kafr El Sheikh"),
  EgyptianGovernorate(nameAr: "الأقصر", nameEn: "Luxor"),
  EgyptianGovernorate(nameAr: "مطروح", nameEn: "Matruh"),
  EgyptianGovernorate(nameAr: "المنيا", nameEn: "Minya"),
  EgyptianGovernorate(nameAr: "المنوفية", nameEn: "Monufia"),
  EgyptianGovernorate(nameAr: "الوادي الجديد", nameEn: "New Valley"),
  EgyptianGovernorate(nameAr: "شمال سيناء", nameEn: "North Sinai"),
  EgyptianGovernorate(nameAr: "البحر الأحمر", nameEn: "Red Sea"),
  EgyptianGovernorate(nameAr: "سوهاج", nameEn: "Sohag"),
  EgyptianGovernorate(nameAr: "جنوب سيناء", nameEn: "South Sinai"),
  EgyptianGovernorate(nameAr: "الشرقية", nameEn: "Sharqia"),
];

class BloodType {
  final String nameAr;
  final String nameEn;

  BloodType({
    required this.nameAr,
    required this.nameEn,
  });
}

// Create a list of blood types
final bloodTypes = [
  BloodType(nameAr: 'A+', nameEn: 'A Positive'),
  BloodType(nameAr: 'A-', nameEn: 'A Negative'),
  BloodType(nameAr: 'B+', nameEn: 'B Positive'),
  BloodType(nameAr: 'B-', nameEn: 'B Negative'),
  BloodType(nameAr: 'AB+', nameEn: 'AB Positive'),
  BloodType(nameAr: 'AB-', nameEn: 'AB Negative'),
  BloodType(nameAr: 'O+', nameEn: 'O Positive'),
  BloodType(nameAr: 'O-', nameEn: 'O Negative'),
];

// Sort the list alphabetically by Arabic name
// egyptianGovernorates.sort((a, b) => a.nameAr.compareTo(b.nameAr));
