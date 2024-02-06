import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';

class CategoryCard2 extends StatelessWidget {
  final String title;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const CategoryCard2(
      {super.key, required this.title, this.prefixIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 0.5))
          ]),
      child: Row(
        children: [
          Icon(
            prefixIcon,
            size: 20,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: "Inder",
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Icon(
            suffixIcon,
            size: 20,
          ),
        ],
      ),
    );
  }
}
