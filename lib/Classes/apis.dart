import 'dart:developer';

import 'package:blood/Classes/BloodCarModel.dart';
import 'package:blood/Classes/BloodRequestModel.dart';
import 'package:blood/main.dart';
import 'package:dio/dio.dart';

class services {
  Future<List<BloodRequestModel>> getBloodRequests() async {
    Response response =
        await Dio().get('https://blood-if5o.onrender.com/api/donor');

    List<dynamic> requests = response.data["donors"];
    List<BloodRequestModel> requestsList = [];
    for (var i = requests.length - 1; i >= 0; i--) {
      requestsList.add(BloodRequestModel.fromJson(response.data, i));
    }
    return requestsList;
  }

  Future<List<BloodCarModel>> getBloodCars() async {
    Response response =
        await Dio().get('https://blood-if5o.onrender.com/api/place');

    List<dynamic> bloodCars = response.data["places"];
    List<BloodCarModel> bloodCarsList = [];
    for (var i = 0; i < bloodCars.length; i++) {
      bloodCarsList.add(BloodCarModel.fromJson(response.data, i));
    }
    return bloodCarsList;
  }
}
