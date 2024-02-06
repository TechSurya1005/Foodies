import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/services/apis/Apis.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Map<String, dynamic> userOne = {};

class GetUserController extends GetxController {
  RxBool isLoading = true.obs;
  Future<void> getAllUsers(BuildContext context) async {
    try {
      final headers = {"Content-type": "application/json"};
      final url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.getProfileData);
      final Map<String, dynamic> body = {
        'mobileNumber': '7869308919',
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        userOne.clear();
        var jsonResponse = json.decode(response.body);
        userOne.addAll(jsonResponse["user"]);
        print(userOne);
      } else {
        Fluttertoast.showToast(
            msg: "Server Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: FoodiesColors.cardBackground,
            textColor: FoodiesColors.textColor,
            fontSize: 16.0.sp);
      }
    } catch (e) {
      print("Errors $e");
      Fluttertoast.showToast(
          msg: "Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: FoodiesColors.cardBackground,
          textColor: FoodiesColors.textColor,
          fontSize: 16.0.sp);
    } finally {
      isLoading.value = false;
    }
  }
}
