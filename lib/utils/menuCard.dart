import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String categoryTitle;

  final VoidCallback? function;
  const MenuCard(
      {super.key,
      required this.image,
      required this.categoryTitle,
      required this.function});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 20.0.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: 70.h,
                  width: 70.w,
                ),
              ),
              Text(
                categoryTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inder',
                  color: FoodiesColors.textColor,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {
                  if (function != null) {
                    function!();
                  }
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: FoodiesColors.accentColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Text(
                    "Show Menu",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: FoodiesColors.card),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
    );
  }
}
