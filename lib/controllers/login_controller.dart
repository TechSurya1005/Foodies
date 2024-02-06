import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/app/loacalization/get_storageData.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/getUsersController.dart';
import 'package:foodies_app/data/models/login_respose.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/apis/Apis.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  late LoginRespose loginResponse;
  Future<void> loginWithMobileNumber(
      String mobilenumber, BuildContext context) async {
    isLoading = true.obs;
    try {
      var headers = {"Content-type": 'application/json'};
      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.login);
      Map body = {
        "mobileNumber": mobilenumber,
      };

      http.Response response =
          await http.patch(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          isLoading=false.obs;
          loginResponse = LoginRespose.fromJson(json);
          GetStorageHelper.setdata(loginResponse);
          Get.offAndToNamed(
            AppRoutes.otpVerification,
            arguments: {
              'number': loginResponse.user.mobileNumber,
              'otp': loginResponse.user.otp,
            },
          );
        }
      } else {
        isLoading = false.obs;
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

      isLoading = false.obs;
      Fluttertoast.showToast(
          msg: "Something went wrong.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: FoodiesColors.cardBackground,
          textColor: FoodiesColors.textColor,
          fontSize: 16.0.sp);
    }
  }
}

