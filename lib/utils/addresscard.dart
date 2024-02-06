import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';

class AddressCard extends StatelessWidget {
  final int addressId;
  final String? addressOf;
  final String addressStatus;
  final String addressType;
  final String actualAddress;
  final String areaAddress;
  final String landmark;
  final double addressDistance;
  const AddressCard(
      {super.key,
      required this.addressId,
      this.addressOf,
      required this.addressStatus,
      required this.addressType,
      required this.actualAddress,
      required this.areaAddress,
      required this.landmark,
      required this.addressDistance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      padding: EdgeInsets.symmetric(vertical: 10.r),
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0.5))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: FoodiesColors.cardBackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  addressType == 'Home'
                      ? CupertinoIcons.home
                      : CupertinoIcons.bag,
                  color: FoodiesColors.textColor,
                  size: 25,
                ),
                SizedBox(
                  width: 50.w,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    "$addressDistance",
                    style: TextStyle(
                        color: FoodiesColors.textColor,
                        fontSize: 12.sp,
                        fontFamily: "Inder"),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10.r, right: 15.r),
                child: Text(
                  addressType,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                width: 200.w,
                margin: EdgeInsets.only(left: 10.r, right: 10.r),
                padding: EdgeInsets.symmetric(vertical: 5.r),
                child: Text(
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.visible,
                  actualAddress + areaAddress + ", " + landmark,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inder',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () => print("More......"),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: FoodiesColors.cardBackground,
              child: ClipOval(
                child: Image.asset(
                  'assets/png/more.png',
                  fit: BoxFit.contain,
                  height: 20,
                  width: 20,
                  color: FoodiesColors.accentColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
