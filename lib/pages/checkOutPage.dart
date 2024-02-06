import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/msgTitle.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/controllers/OptionControllerRadio.dart';
import 'package:foodies_app/data/models/payementModes.dart';
import 'package:foodies_app/screens/mainHome/mainHome.dart';
import 'package:foodies_app/utils/chekOutProductCard.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  String selectedPayMode = 'Cash';

  OptionController _optionController = Get.put(OptionController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              automaticallyImplyLeading: true,
              elevation: 8,
              title: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.visible,
                  "Check Out Details",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: h * 0.028,
                      color: FoodiesColors.textColor),
                ),
              ),
              iconTheme: const IconThemeData(color: FoodiesColors.textColor),
              backgroundColor: FoodiesColors.cardBackground,
            ),
            SliverToBoxAdapter(
              child: Container(
                decoration:
                    BoxDecoration(color: FoodiesColors.cardColor, boxShadow: [
                  BoxShadow(
                      blurRadius: 0.2,
                      spreadRadius: 0.2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 0.5))
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/png/distance.png',
                            fit: BoxFit.contain,
                            height: 30.h,
                            width: 30.w,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Jalapeno Pizza",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                        width: 1,
                                        height: 20.h,
                                        color: FoodiesColors.accentColor
                                            .withOpacity(0.5)),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Delivery in : 30 mins",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Container(
                                        width: 1,
                                        height: 20.h,
                                        color: FoodiesColors.accentColor
                                            .withOpacity(0.5)),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    SizedBox(
                                      width: 220.w,
                                      child: Text(
                                        "2nd Floor Govind Kunj, Civil Lines, Raipur",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: w,
                        color: Colors.green.shade100,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/png/discount.png",
                                height: 30.h,
                                width: 30.w,
                                color: Colors.green.shade900,
                              ),
                              Text(
                                "Save upto ${Words.INRSymbol} 99 more with payment offers",
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontFamily: "Inder",
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green.shade900),
                              ),
                              Icon(
                                CupertinoIcons.forward,
                                color: Colors.green.shade900,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Pay on Delivery",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.grey.shade300),
                          child: Image.asset('assets/png/money.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pay on Delivery (Cash/UPI)",
                                style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 230.w,
                                child: Text(
                                  "Pay on cash to delivery partner or ask for QR code to pay via UPI.",
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(() => Radio(
                              activeColor: FoodiesColors.accentColor,
                              value: "Cash",
                              groupValue:
                                  _optionController.selectedPayMode.value,
                              onChanged: (value) {
                                _optionController.changePayMode(value!);
                              },
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "UPI",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //UPI Containers
                    Container(
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Colors.grey.shade300),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset('assets/png/phonepe.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "PhonePe",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Obx(() => Radio(
                                      activeColor: FoodiesColors.accentColor,
                                      value: "PhonePe",
                                      groupValue: _optionController
                                          .selectedPayMode.value,
                                      onChanged: (value) {
                                        _optionController.changePayMode(value!);
                                      },
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Colors.grey.shade300),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:
                                        Image.asset('assets/png/googlepay.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Google Pay",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Obx(() => Radio(
                                      activeColor: FoodiesColors.accentColor,
                                      value: "Google Pay",
                                      groupValue: _optionController
                                          .selectedPayMode.value,
                                      onChanged: (value) {
                                        _optionController.changePayMode(value!);
                                      },
                                    ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: Colors.grey.shade300),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/png/paytm.png'),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Paytm",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Obx(() => Radio(
                                      activeColor: FoodiesColors.accentColor,
                                      value: "Paytm",
                                      groupValue: _optionController
                                          .selectedPayMode.value,
                                      onChanged: (value) {
                                        _optionController.changePayMode(value!);
                                      },
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            height: 50.h,
            width: w,
            margin: EdgeInsets.all(10.0.r),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: FoodiesColors.cardBackground),
            child: InkWell(
              onTap: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.topSlide,
                  dialogType: DialogType.success,
                  title: MsgTitle.Success,
                  desc: "Your order has been confirmed.",
                  btnOkColor: FoodiesColors.accentColor,
                  btnOkOnPress: () {
                    Get.offAndToNamed(AppRoutes.homeMain);
                  },
                  descTextStyle:
                      const TextStyle(fontSize: FontSize.smallBodyText),
                ).show();
              },
              child: Container(
                alignment: Alignment.center,
                width: w,
                margin: EdgeInsets.symmetric(horizontal: 5.r),
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 15.r),
                decoration: BoxDecoration(
                    color: FoodiesColors.accentColor,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  "PROCEED NOW",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )));
  }
}
