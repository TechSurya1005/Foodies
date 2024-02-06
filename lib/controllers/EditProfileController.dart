import 'dart:async';
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../services/apis/Apis.dart';

class EditProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Future<void> EditProfile(String fullName, String mobile, String gender, context) async {
    try {
      isLoading = true.obs;
      var headers = {"Content-type": 'application/json'};

      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.userUpdate);
      Map body = {
        "fullName": fullName,
        "mobileNumber" : mobile,
        "gender" : gender
      };

      http.Response response =
          await http.patch(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          isLoading = false.obs;
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  animType: AnimType.topSlide,
                  title: "Success",
                  titleTextStyle: const TextStyle(
                      color: Color(0xFF293265),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                  desc: "Saved Successfully",
                  descTextStyle: const TextStyle(fontSize: 18),
                  btnOkOnPress: () {
                    Get.obs();
                  },
                  btnOkColor: FoodiesColors.accentColor)
              .show();
        }
      } else {
        isLoading = false.obs;
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                animType: AnimType.topSlide,
                title: "Error",
                titleTextStyle: const TextStyle(
                    color: Color(0xFF293265),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                desc: "Something went wrong",
                descTextStyle: const TextStyle(fontSize: 18),
                btnOkOnPress: () {
                  Get.obs();
                },
                btnOkColor: FoodiesColors.accentColor)
            .show();
      }
    } catch (e) {
      isLoading = false.obs;
      AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.topSlide,
              title: "Error",
              titleTextStyle: const TextStyle(
                  color: Color(0xFF293265),
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
              desc: "Server Error",
              descTextStyle: const TextStyle(fontSize: 18),
              btnOkOnPress: () {
                Get.obs();
              },
              btnOkColor: FoodiesColors.accentColor)
          .show();
    }
  }
}
