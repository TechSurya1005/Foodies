import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appMessages.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/msgTitle.dart';
import 'package:foodies_app/controllers/get_Image.dart';
import 'package:foodies_app/controllers/permmision_controllers.dart';
import 'package:foodies_app/main.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Get_Image _get_image = Get.put(Get_Image());
  PermissionController _permissionController = Get.put(PermissionController());


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
            ),
            backgroundColor: FoodiesColors.cardBackground,
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Profile",
              style: TextStyle(
                  color: FoodiesColors.textColor,
                  fontSize: h * 0.025.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          const AssetImage(AppAssets.profile_sample),
                      radius: 50.r,
                      child: Obx(() => ClipOval(
                        child: _get_image.image == null
                            ? Image.asset(
                          AppAssets.profile_sample,
                          fit: BoxFit.cover,
                          height: 150.h,
                          width: 150.w,
                        )
                            : Image.file(
                          _get_image.image!,
                          height: 150.h,
                          width: 150.w,
                          fit: BoxFit.cover,
                        ),
                      ),)
                    ),
                    Positioned(
                      right: 0,
                      bottom: 5,
                      child: CircleAvatar(
                          backgroundColor: FoodiesColors.cardBackground,
                          radius: 15,
                          child: IconButton(
                              onPressed: () {
                                selectSourceDialog(context);
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 15,
                                color: Colors.black,
                              ))),
                    )
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 20.r),
                  child: const Text(
                    "Suryakant Ajay",
                    style: AppTextStyles.homeTitleStyle,
                  ),
                ),
                SizedBox(
                  height: 20.r,
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 15.r, vertical: 10.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: FoodiesColors.cardColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0.5))
                      ]),
                  child: Column(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 30.sp,
                      ),
                      Text(
                        "Food Like",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: 15.r, vertical: 10.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: FoodiesColors.cardColor,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0.5))
                      ]),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.credit_card,
                        size: 30,
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Get.toNamed(AppRoutes.themeChange),
                  child: Container(
                    padding: EdgeInsetsDirectional.symmetric(
                        horizontal: 15.r, vertical: 10.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: FoodiesColors.cardColor,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 0.2,
                              spreadRadius: 0.2,
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 0.5))
                        ]),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/png/theme.png",
                          height: 30.h,
                          width: 30.w,
                        ),
                        Text(
                          "Theme",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.profileEdit),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.r, vertical: 15.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: FoodiesColors.cardColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 0.5))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.person_2_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: FontSize.mediumBodyText,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 10.h,
                  // ),
                  // Container(
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(10.r),
                  //       color: FoodiesColors.cardColor,
                  //       boxShadow: [
                  //         BoxShadow(
                  //             blurRadius: 0.2,
                  //             spreadRadius: 0.2,
                  //             color: Colors.black.withOpacity(0.3),
                  //             offset: const Offset(0, 0.5))
                  //       ]),
                  //   child: const Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         "New Letter",
                  //         style: TextStyle(
                  //             fontSize: FontSize.mediumBodyText,
                  //             fontFamily: 'Inter',
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //       Icon(CupertinoIcons.forward),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.addressbook),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.r, vertical: 15.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: FoodiesColors.cardColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 0.5))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.list_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "Address",
                            style: TextStyle(
                                fontSize: FontSize.mediumBodyText,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.feedback),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.r, vertical: 15.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: FoodiesColors.cardColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 0.5))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.feedback_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "Feedback",
                            style: TextStyle(
                                fontSize: FontSize.mediumBodyText,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.about),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.r, vertical: 15.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: FoodiesColors.cardColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 0.5))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.library_books_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "About Us",
                            style: TextStyle(
                                fontSize: FontSize.mediumBodyText,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.supportUs);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.r, vertical: 15.r),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: FoodiesColors.cardColor,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 0.2,
                                spreadRadius: 0.2,
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 0.5))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.contacts_outlined),
                          SizedBox(
                            width: 10.w,
                          ),
                          const Text(
                            "Contact Us",
                            style: TextStyle(
                                fontSize: FontSize.mediumBodyText,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          const Icon(CupertinoIcons.forward),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: InkWell(
              onTap: () {
                Get.offNamed(AppRoutes.loginNumber);
                box.write('isLogged', false);
                print(box.read('isLogged'));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border:
                      Border.all(width: 1, color: FoodiesColors.accentColor),
                ),
                child: Text(
                  "Log Out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: FoodiesColors.accentColor,
                    fontFamily: 'Inter',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: FoodiesColors.cardBackground,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          title: Center(
            child: Text('Select Image Source',style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  if(_permissionController.cameraPermissionGranted==false){
                    _permissionController.requestCameraPermission();
                  }else{
                    _get_image.getProfileCamera();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0.r),
                    color: FoodiesColors.backgroundColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt,size: 22.sp,color: Colors.black,),
                        const Text(' Camera',style: TextStyle(
                          color: FoodiesColors.secondaryColor,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.0.h),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  _get_image.getProfileImageGallery();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0.r),
                      color: FoodiesColors.backgroundColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.image,size: 22.sp,color: FoodiesColors.secondaryColor,),
                        const Text(' Gallery',style: TextStyle(
                          color: FoodiesColors.secondaryColor,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


