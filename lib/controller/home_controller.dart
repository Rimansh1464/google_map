import 'dart:convert';

import 'package:apicalling/api/api_service.dart';

import '../model/trip_location_model.dart';
import 'base_controller.dart';
import 'package:get/get.dart';
import 'package:apicalling/api/api.dart';

class HomeController extends BaseController {

  Rx<TripLocationModel> tripLocationData = TripLocationModel().obs;


  // Future<void> getTripId() async {
  //   try {
  //     showLoader();
  //     apiService.getRequest(
  //         url: ApiUrl.trip,
  //         onSuccess: (Map<String, dynamic> data) async {
  //           dismissLoader();
  //           tripLocationData.value =
  //               tripLocationModelToJson(jsonEncode(data["response"])) as TripLocationModel;
  //         },
  //         onError: onError)
  //   }
  // }

}