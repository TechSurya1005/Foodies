import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../data/models/categoryDataModal.dart';
import '../services/apis/Apis.dart';

class GetCategoryController extends GetxController {
  RxBool isLoading = true.obs;
  CategoryDataModals _categoryDataModals = CategoryDataModals();
  RxList allCategoryData = [].obs;

  Future<void> fetchCategories(BuildContext context) async {
    try {
      var headers = {"Content-type": 'application/json'};
      var url = Uri.parse(APIs.baseUrl + APIs.authEndPoints.getCategory);

      if (isLoading.isTrue) {
        const CircularProgressIndicator();
      }

      http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        _categoryDataModals = CategoryDataModals.fromJson(jsonResponse);

        // categoryName.clear();
        // categoryImage.clear();
        // _categoryDataModals.category?.forEach((element) {
        //   categoryName.add(element.categoryName);
        //   categoryImage.add(element.image);
        // });
        allCategoryData.clear();
        _categoryDataModals.category?.forEach((element) {
          Map<String, dynamic> categoryItemData = element.toJson();
          allCategoryData.add(categoryItemData);
        });
        // print(allCategoryData);

        isLoading.value = false;
      } else {
        Fluttertoast.showToast(
            msg: "Server error",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: FoodiesColors.cardBackground,
            textColor: FoodiesColors.textColor,
            fontSize: 16.0.sp);
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
          fontSize: 16.0.sp);
    }
  }
}
