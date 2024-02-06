import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';

class AppTextStyles {
  static const headingStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Inter');

  static const paragraphStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    color: FoodiesColors.textColor,
  );
  static const productDesc = TextStyle(
    fontSize: 16,
    fontFamily: 'Inder',
  );
  static const titleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inder',
    color: FoodiesColors.textColor,
  );
  static const homeTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
    color: FoodiesColors.textColor,
  );

  static const TextStyle bottomNavTextStyle = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
      fontStyle: FontStyle.italic,
      fontFamily: 'Inter');
}
