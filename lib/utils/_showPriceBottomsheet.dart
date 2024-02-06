import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';

class ShowPriceBottomSheet extends StatefulWidget {
  ShowPriceBottomSheet({super.key});

  @override
  State<ShowPriceBottomSheet> createState() => _ShowPriceBottomSheetState();
}

class _ShowPriceBottomSheetState extends State<ShowPriceBottomSheet> {
  RangeValues _currentRangeValues = const RangeValues(99, 1000);

  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(
      _currentRangeValues.start.round().toString(),
      _currentRangeValues.end.round().toString(),
    );
    double price1 = 0.0;
    double price2 = 0.0;
    setState(() {
      price1 = double.parse(labels.start);
      price2 = double.parse(labels.end);
    });

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
        height: h * 0.75,
        width: w,
        child: Stack(children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: h * 0.25,
                  width: w,
                  decoration: BoxDecoration(
                    color: FoodiesColors.cardBackground,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, -0.25),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          bottom: 10,
                        ),
                        child: const Text(
                          "Filter By Price",
                          style: AppTextStyles.homeTitleStyle,
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: FoodiesColors.accentColor,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: RangeSlider(
                          activeColor: Colors.yellow,
                          values: _currentRangeValues,
                          max: 1000,
                          min: 0,
                          divisions: 5,
                          labels: labels,
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: FoodiesColors.accentColor,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Price $price1 - $price2",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16.sp,
                                      color: FoodiesColors.textColor,
                                      fontWeight: FontWeight.bold),
                                )),
                            InkWell(
                              onTap: () => Get.back(),
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 15, right: 15, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: FoodiesColors.accentColor),
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                      color: FoodiesColors.cardColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
