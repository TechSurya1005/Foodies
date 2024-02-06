import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/changeCardColors.dart';
import 'package:get/get.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  bool isLang = true;
  bool isSuggested = true;

  final ChangeCardColors changeCardColors = Get.put(ChangeCardColors());

  List<String> listSuggestions = [
    "Order Delayed",
    "Missing Items in My Order",
    "Incorrect Order Received",
    "Food Quality Issue",
    "Delivery Address Update",
    "Payment Refund Request",
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: FoodiesColors.cardBackground,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Support",
          style: AppTextStyles.homeTitleStyle,
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
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
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: const Text(
                      textAlign: TextAlign.center,
                      "Call",
                      style: AppTextStyles.homeTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Icon(
                    CupertinoIcons.person,
                    size: 24.sp,
                    color: FoodiesColors.accentColor,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 10.r),
                      child: Text(
                        "Can contact call through via",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Inter",
                        ),
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    padding: EdgeInsets.symmetric(horizontal: 10.r),
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: TextFormField(
                      initialValue: "7869308919",
                      decoration: const InputDecoration(
                          hintText: "Enter your mobile number",
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10.r),
                            child: Text(
                              "Language :",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Inter",
                              ),
                            )),
                        const Spacer(),
                        Text(
                          "English",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        Radio(
                          value: true,
                          groupValue: isLang,
                          onChanged: (value) {
                            setState(() {
                              isLang = value as bool;
                            });
                          },
                        ),
                        Text(
                          "Hindi",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Inter",
                          ),
                        ),
                        Radio(
                          value: false,
                          groupValue: isLang,
                          onChanged: (value) {
                            setState(() {
                              isLang = value as bool;
                            });
                          },
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 10.r),
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.r, vertical: 15.r),
                      decoration: BoxDecoration(
                        color: FoodiesColors.accentColor,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        "Request Call",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: h * 0.45,
          //     margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
          //     decoration: BoxDecoration(
          //         color: FoodiesColors.cardColor,
          //         borderRadius: BorderRadius.circular(10.r),
          //         boxShadow: [
          //           BoxShadow(
          //               blurRadius: 0.2,
          //               spreadRadius: 0.2,
          //               color: Colors.black.withOpacity(0.3),
          //               offset: const Offset(0, 0.5))
          //         ]),
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: [
          //           SizedBox(
          //             height: 10.h,
          //           ),
          //           Container(
          //             alignment: Alignment.center,
          //             child: const Text(
          //               textAlign: TextAlign.center,
          //               "Chat",
          //               style: AppTextStyles.homeTitleStyle,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 20.h,
          //           ),
          //           Icon(
          //             CupertinoIcons.chat_bubble_text,
          //             size: 24.sp,
          //             color: FoodiesColors.accentColor,
          //           ),
          //           SizedBox(
          //             height: 20.h,
          //           ),
          //           Container(
          //               alignment: Alignment.center,
          //               padding: EdgeInsets.only(left: 10.r),
          //               child: Text(
          //                 "Can chat to our support member anytime",
          //                 style: TextStyle(
          //                   fontSize: 16.sp,
          //                   fontWeight: FontWeight.w500,
          //                   fontFamily: "Inter",
          //                 ),
          //               )),
          //           SizedBox(
          //             height: 20.h,
          //           ),
          //           Container(
          //               alignment: Alignment.center,
          //               padding: EdgeInsets.only(left: 10.r),
          //               child: Text(
          //                 "Suggested reason for seeking support team",
          //                 style: TextStyle(
          //                   fontSize: 14.sp,
          //                   fontWeight: FontWeight.w500,
          //                   fontFamily: "Inter",
          //                 ),
          //               )),
          //           Container(
          //             margin: EdgeInsets.symmetric(
          //                 horizontal: 10.r, vertical: 10.r),
          //             height: h * 0.22,
          //             width: w,
          //             child: GridView.builder(
          //               itemCount: listSuggestions.length,
          //               gridDelegate:
          //                   const SliverGridDelegateWithFixedCrossAxisCount(
          //                       crossAxisCount: 2,
          //                       childAspectRatio: 3,
          //                       mainAxisSpacing: 2),
          //               itemBuilder: (BuildContext context, int index) {
          //                 return Obx(() => InkWell(
          //                       onTap: () {
          //                         if (changeCardColors.isSuggested(index) ==
          //                             true) {
          //                           changeCardColors
          //                               .toggleRemoveSuggested(index);
          //                         } else {
          //                           changeCardColors.toggleAddSuggested(index);
          //                         }
          //                       },
          //                       child: Container(
          //                         alignment: Alignment.center,
          //                         margin: EdgeInsets.symmetric(
          //                             horizontal: 5.r, vertical: 5.r),
          //                         padding:
          //                             EdgeInsets.symmetric(horizontal: 5.r),
          //                         width: w * 0.02.w,
          //                         decoration: BoxDecoration(
          //                           color: changeCardColors.isSuggested(index)
          //                               ? FoodiesColors.accentColor
          //                               : FoodiesColors.cardBackground,
          //                           borderRadius: BorderRadius.circular(10.r),
          //                         ),
          //                         child: Text(
          //                           listSuggestions[index],
          //                           textAlign: TextAlign.center,
          //                           overflow: TextOverflow.visible,
          //                           style: TextStyle(
          //                               color:
          //                                   changeCardColors.isSuggested(index)
          //                                       ? Colors.white
          //                                       : FoodiesColors.textColor,
          //                               fontSize: 14.sp,
          //                               fontFamily: AppFonts.Inder,
          //                               fontWeight: FontWeight.w500),
          //                         ),
          //                       ),
          //                     ));
          //               },
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10.h,
          //           ),
          //           Container(
          //             margin: EdgeInsets.symmetric(horizontal: 10.r),
          //             padding: EdgeInsets.symmetric(horizontal: 10.r),
          //             decoration: BoxDecoration(
          //               border: Border.all(),
          //             ),
          //             child: TextFormField(
          //               // initialValue: "7869308919",
          //               decoration: const InputDecoration(
          //                 hintText: "Type a problems",
          //                 border: InputBorder.none,
          //               ),
          //             ),
          //           ),
          //           SizedBox(
          //             height: 10.h,
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
