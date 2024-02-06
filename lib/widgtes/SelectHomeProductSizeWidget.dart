import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:get/get.dart';

import '../controllers/selectProductSizesController.dart';

class SelectItemSize extends StatefulWidget {
  const SelectItemSize({super.key});

  @override
  State<SelectItemSize> createState() => _SelectItemSizeState();
}

class _SelectItemSizeState extends State<SelectItemSize> {
  String selectedOption = 'Size';

  final SelectProductSizeController _productSizeController =
      Get.put(SelectProductSizeController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
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
                decoration: BoxDecoration(
                    color: FoodiesColors.cardBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, -0.25))
                    ]),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin:
                          EdgeInsets.only(top: 20.h, left: 20.w, bottom: 10.h),
                      child: const Text(
                        "Select Size",
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
                        margin: const EdgeInsets.only(left: 10, top: 10),
                        child: Column(children: [
                          Obx(
                            () => ListTile(
                              leading: Radio(
                                activeColor: FoodiesColors.accentColor,
                                value: "Regular",
                                groupValue: _productSizeController.selectedSize,
                                onChanged: (value) {
                                  _productSizeController.onChanged(value);
                                },
                              ),
                              title: const Text(
                                "Regular",
                                style: AppTextStyles.titleStyle,
                              ),
                              trailing: const Text(
                                "${Words.INRSymbol}305",
                                style: AppTextStyles.titleStyle,
                              ),
                            ),
                          ),
                          Obx(
                            () => ListTile(
                              leading: Radio(
                                activeColor: FoodiesColors.accentColor,
                                value: "Medium",
                                groupValue: _productSizeController.selectedSize,
                                onChanged: (value) {
                                  _productSizeController.onChanged(value);
                                },
                              ),
                              title: const Text(
                                "Medium",
                                style: AppTextStyles.titleStyle,
                              ),
                              trailing: const Text(
                                "${Words.INRSymbol}555",
                                style: AppTextStyles.titleStyle,
                              ),
                            ),
                          ),
                          Obx(() => ListTile(
                                leading: Radio(
                                  activeColor: FoodiesColors.accentColor,
                                  value: "Large",
                                  groupValue:
                                      _productSizeController.selectedSize,
                                  onChanged: (value) {
                                    _productSizeController.onChanged(value);
                                  },
                                ),
                                title: const Text(
                                  "Large",
                                  style: AppTextStyles.titleStyle,
                                ),
                                trailing: const Text(
                                  "${Words.INRSymbol}805",
                                  style: AppTextStyles.titleStyle,
                                ),
                              ))
                        ])),
                    const Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: FoodiesColors.accentColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
