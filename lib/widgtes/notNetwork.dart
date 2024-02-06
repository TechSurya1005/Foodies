import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';

class NoNetwork extends StatefulWidget {
  const NoNetwork({super.key});

  @override
  State<NoNetwork> createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              "Not Network",
              style: TextStyle(
                  fontFamily: "Inder",
                  color: FoodiesColors.accentColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              width: 100.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: FoodiesColors.accentColor,
              ),
              child: Text(
                "Refresh",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Inter",
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}
