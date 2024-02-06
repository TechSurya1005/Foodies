import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/feedbackOptions%20.dart';

class PlaceLocationTile extends StatelessWidget {
  final String title;
  final String desc;
  final double dis;
  const PlaceLocationTile({super.key, required this.title, required this.desc, required this.dis});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0.h),
      decoration: BoxDecoration(
        color: FoodiesColors.cardColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: const Icon(
          Icons.location_on,
          size: 25,
          color: FoodiesColors.accentColor,
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
            Text(
             desc,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: AppFonts.Inder),
            ),
          ],
        ),
        trailing: Text(
          " $dis Km",
          style: TextStyle(
            fontSize: 12.sp,
            fontFamily: AppFonts.Inter,
          ),
        ),
      ),
    );;
  }
}
