import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/checkBoxController.dart';
import 'package:foodies_app/utils/_showPriceBottomsheet.dart';
import 'package:foodies_app/utils/categoryCard2.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class CategoryList2 extends StatefulWidget {
  const CategoryList2({super.key});

  @override
  State<CategoryList2> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList2> {
  bool isRating = false;
  bool isRatingHL = false;
  bool isDeliveryTimeHighToLow = false;
  bool isDeliveryTimeLowToHigh = false;
  bool costLH = false;
  bool costHL = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ShortCheckboxController checkboxController =
      Get.put(ShortCheckboxController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      height: 55.h,
      width: w.w,
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      enableDrag: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        Colors.black.withOpacity(0.5),
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
                                    width: w.w,
                                    decoration: BoxDecoration(
                                        color: FoodiesColors.cardBackground,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20.r),
                                            topRight: Radius.circular(20.r)),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 0.5,
                                              spreadRadius: 0.5,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              offset: const Offset(0, -0.25))
                                        ]),
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          margin: EdgeInsets.only(
                                              top: 20.h,
                                              left: 20.w,
                                              bottom: 10.h),
                                          child: const Text(
                                            "Sort",
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
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Rating : High To Low",
                                                style: AppTextStyles.titleStyle,
                                              ),
                                              Obx(() => Checkbox(
                                                    checkColor: Colors.white,
                                                    activeColor: FoodiesColors.accentColor,
                                                    value: checkboxController
                                                        .isRatingHL.value,
                                                    onChanged: (bool? value) {
                                                      checkboxController
                                                          .toggleCheckbox(
                                                              'isRatingHL');
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Rating : Low To High",
                                                style: AppTextStyles.titleStyle,
                                              ),
                                              Obx(() => Checkbox(
                                                    checkColor: Colors.white,
                                                activeColor: FoodiesColors.accentColor,
                                                    value: checkboxController
                                                        .isRating.value,
                                                    onChanged: (bool? value) {
                                                      checkboxController
                                                          .toggleCheckbox(
                                                              'isRating');
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Delivery Distance : Low To High",
                                                style: AppTextStyles.titleStyle,
                                              ),
                                              Obx(() => Checkbox(
                                                activeColor: FoodiesColors.accentColor,
                                                    checkColor: Colors.white,
                                                    value: checkboxController
                                                        .isDeliveryTimeLowToHigh
                                                        .value,
                                                    onChanged: (bool? value) {
                                                      checkboxController
                                                          .toggleCheckbox(
                                                              'isDeliveryTimeLowToHigh');
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Delivery Distance : High To Low",
                                                style: AppTextStyles.titleStyle,
                                              ),
                                              Obx(() => Checkbox(
                                                activeColor: FoodiesColors.accentColor,
                                                    checkColor: Colors.white,
                                                    value: checkboxController
                                                        .isDeliveryTimeHighToLow
                                                        .value,
                                                    onChanged: (bool? value) {
                                                      checkboxController
                                                          .toggleCheckbox(
                                                              'isDeliveryTimeHighToLow');
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Cost : Low To High",
                                                style: AppTextStyles.titleStyle,
                                              ),
                                              Obx(() => Checkbox(
                                                activeColor: FoodiesColors.accentColor,
                                                    checkColor: Colors.white,
                                                    value: checkboxController
                                                        .costLH.value,
                                                    onChanged: (bool? value) {
                                                      checkboxController
                                                          .toggleCheckbox(
                                                              'costLH');
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.only(
                                              left: 20.w, bottom: 10.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Cost : High To Low",
                                                style: AppTextStyles.titleStyle,
                                              ),
                                              Obx(() => Checkbox(
                                                activeColor: FoodiesColors.accentColor,
                                                    checkColor: Colors.white,
                                                    value: checkboxController
                                                        .costHL.value,
                                                    onChanged: (bool? value) {
                                                      checkboxController
                                                          .toggleCheckbox(
                                                              'costHL');
                                                    },
                                                  )),
                                            ],
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 1,
                                          indent: 10,
                                          endIndent: 10,
                                          color: FoodiesColors.accentColor,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 15.w, right: 20.h),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    checkboxController.clearToggle();
                                                  },
                                                  child: Text(
                                                    "Clear All",
                                                    style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16.sp,
                                                        color: FoodiesColors
                                                            .accentColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              InkWell(
                                                onTap: () => Get.back(),
                                                child: Container(
                                                  padding: EdgeInsets.only(
                                                      top: 10.h,
                                                      left: 15.w,
                                                      right: 15.w,
                                                      bottom: 10.h),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.r),
                                                      color: FoodiesColors
                                                          .accentColor),
                                                  child: Text(
                                                    "Apply",
                                                    style: TextStyle(
                                                        color: FoodiesColors
                                                            .cardColor,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      });
                },
                child: const CategoryCard2(
                  prefixIcon: Icons.swap_horiz,
                  title: 'Short',
                  suffixIcon: Icons.arrow_drop_down,
                ),
              ),
            );
          } else if (index == 1) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      enableDrag: false,
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: ((context) {
                        return ShowPriceBottomSheet(
                          key: _scaffoldKey,
                        );
                      }));
                },
                child: const CategoryCard2(
                  prefixIcon: Icons.money_sharp,
                  title: 'Filter By Price',
                ),
              ),
            );
          } else if (index == 2) {
            return const Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryCard2(
                prefixIcon: Icons.star,
                title: 'Rating 4.4',
              ),
            );
          } else {
            return const Padding(
              padding: EdgeInsets.all(5.0),
              child: CategoryCard2(
                title: 'Nearest',
              ),
            );
          }
        },
      ),
    );
  }
}
