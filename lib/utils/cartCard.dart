import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class CartCard extends StatelessWidget {
  final String image;
  final String title;
  final String variant;
  final String portionSize;
  final int qty;
  final double price;

  const CartCard(
      {super.key,
      required this.image,
      required this.title,
      required this.variant,
      required this.portionSize,
      required this.qty,
      required this.price});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: FoodiesColors.cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.2,
            spreadRadius: 0.2,
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 0.5),
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
            height: h * 0.1.h,
            width: w * 0.2.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: w * 0.35.w,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  "$variant,$portionSize",
                  style: TextStyle(
                    color: FoodiesColors.textColor.withOpacity(0.5),
                    fontSize: 14.sp,
                    fontFamily: 'Inder',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                width: 150.w,
                child: Text(
                  "₹ " + "$price",
                  style: TextStyle(
                    color: FoodiesColors.accentColor,
                    fontSize: 14.sp,
                    fontFamily: 'Inder',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close),
                  color: FoodiesColors.accentColor,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: h * 0.085.w,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                margin: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                    color: FoodiesColors.accentColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "-",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$qty',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "+",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
