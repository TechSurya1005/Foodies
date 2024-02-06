import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/controllers/orderQntyBtn.dart';
import 'package:get/get.dart';

class FoodDetails extends StatefulWidget {
  const FoodDetails({super.key});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  OrderQtyBtn orderQtyBtn = Get.put(OrderQtyBtn());

  String selectedOption = 'Option 1';

  int Qtyval = 1;
  final arguments = Get.arguments;
  String tag = "";

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    if (arguments != null) {
      tag = arguments;
    } else {
      print("Error Argument");
    }

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: FoodiesColors.cardBackground,
            padding: const EdgeInsets.only(top: 40, bottom: 10),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: 30.h,
                    )),
                const Spacer(),
                Text(
                  "Chicken Pizza",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 22.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: (w * .586796 + ((w - 375) / 2)).roundToDouble(),
            decoration:
                BoxDecoration(color: FoodiesColors.cardColor, boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 10.h,
                  spreadRadius: 0.5.h,
                  offset: const Offset(0, 1))
            ]),
            child: Hero(tag: tag, child: Image.asset(AppAssets.pizza_ai1)),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: const Text(
                  "Change Size",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Inder",
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, top: 10),
                  child: Column(children: [
                    ListTile(
                      leading: Radio(
                        activeColor: FoodiesColors.accentColor,
                        value: "Regular",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
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
                    ListTile(
                      leading: Radio(
                        activeColor: FoodiesColors.accentColor,
                        value: "Medium",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
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
                    ListTile(
                      leading: Radio(
                        activeColor: FoodiesColors.accentColor,
                        value: "Large",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
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
                    )
                  ]))
            ],
          ),
        ),
      ]),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: FoodiesColors.cardBackground),
        child: Container(
          padding: EdgeInsets.all(15.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 5.r),
                height: 60.h,
                width: 150.w,
                decoration: BoxDecoration(
                    color: FoodiesColors.accentColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        orderQtyBtn.qtyDecrement();
                      },
                      child: Text(
                        "-",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(
                      () => Text(
                        orderQtyBtn.Qty.value.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        orderQtyBtn.qtyIncrement();
                      },
                      child: Text(
                        "+",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.cartScreen);
                },
                child: Container(
                  height: 60.h,
                  width: 150.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border:
                        Border.all(color: FoodiesColors.accentColor, width: 2),
                  ),
                  child: Text(
                    "Add to card",
                    style: TextStyle(
                        color: FoodiesColors.accentColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
