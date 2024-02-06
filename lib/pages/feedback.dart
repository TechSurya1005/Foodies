import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FoodiesColors.cardBackground,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Feedback",
          style: AppTextStyles.homeTitleStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: Text(
              "Title",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 20.r,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: TextFormField(
              decoration: const InputDecoration(

                  hintText: "Feedback title", border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: Text(
              "Description",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 100.h,
            margin: EdgeInsets.symmetric(
              horizontal: 20.r,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
            ),
            child: TextFormField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Write your feedback here.....",
                  border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
              padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
              decoration: BoxDecoration(
                color: FoodiesColors.accentColor,
                borderRadius: BorderRadius.circular(10.r),
                // border:
                //     Border.all(width: 1, color: FoodiesColors.accentColor),
              ),
              child: Text(
                "Submit",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
