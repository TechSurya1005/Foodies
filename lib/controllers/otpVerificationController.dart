import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/main.dart';
import 'package:foodies_app/services/apis/Apis.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OTPVerifyController extends GetxController {
  RxBool isLoading = false.obs;
  Future<void> verifyWithOTP(
      String mobile,
      String otp1,
      String otp2,
      String otp3,
      String otp4,
      String otp5,
      String otp6,
      BuildContext context) async {
    isLoading = true.obs;
    try {
      var headers = {"Content-type": 'application/json'};
      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.verifyOtp);
      var OTP = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;
      Map body = {"mobileNumber": mobile, "otp": OTP};

      http.Response response =
          await http.patch(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json['success'] == true) {
          isLoading = false.obs;
          box.write('is_logged_in', true);
          print(box.read('is_logged_in'));

          final userData = json['user'];
          final token = userData['token'];
          box.write("access_token", token);
          Get.offAndToNamed(AppRoutes.homeMain);
        } else {
          Fluttertoast.showToast(
              msg: "Invalid OTP",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: FoodiesColors.cardBackground,
              textColor: FoodiesColors.textColor,
              fontSize: 16.0.sp);
        }
      } else {
        Fluttertoast.showToast(
            msg: "Connection Error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: FoodiesColors.cardBackground,
            textColor: FoodiesColors.textColor,
            fontSize: 16.0.sp);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Connection Error",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: FoodiesColors.cardBackground,
          textColor: FoodiesColors.textColor,
          fontSize: 16.0.sp);
    }
  }
}
