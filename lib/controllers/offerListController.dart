import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/data/models/offerDataModal.dart';
import 'package:foodies_app/data/models/offerDataModal2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/apis/Apis.dart';

class OfferController extends GetxController {
  RxBool isLoading = true.obs;
  OfferDataModal2 _offerDataModal = OfferDataModal2();
  RxList allOfferData = [].obs;

  Future<void> fetchOfferData(BuildContext context) async {
    try {
      var headers = {"Content-type": 'application/json'};
      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.getOfferList);

      if (isLoading.isTrue) {
        const CircularProgressIndicator();
      }

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        _offerDataModal = OfferDataModal2.fromJson(jsonResponse);
        allOfferData.clear();
        _offerDataModal.offer?.forEach((element) {
          Map<String, dynamic> offerItemData = element.toJson();
          allOfferData.add(offerItemData);
        });

        isLoading.value = false;
      } else {
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: FoodiesColors.cardBackground,
            textColor: FoodiesColors.textColor,
            fontSize: 16.0);
      }
    } catch (e) {
      print("Error : $e");
      Fluttertoast.showToast(
          msg: "Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: FoodiesColors.cardBackground,
          textColor: FoodiesColors.textColor,
          fontSize: 16.0);
    }
  }
}
