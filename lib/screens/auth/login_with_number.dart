import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/appMessages.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/msgTitle.dart';
import 'package:foodies_app/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginWithNumber extends StatefulWidget {
  const LoginWithNumber({super.key});

  @override
  State<LoginWithNumber> createState() => _LoginWithNumberState();
}

class _LoginWithNumberState extends State<LoginWithNumber> {
  final _mobileNumber = TextEditingController();

  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: TextButton(
              onPressed: () {
                Get.offNamed(AppRoutes.homeMain);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  fontSize: h * 0.025.sp,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 180.h,
            width: w.w,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: const DecorationImage(
                    image: AssetImage('assets/images/loginbanner.jpg'),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.2,
                      spreadRadius: 0.2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0.5, 0.5))
                ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
            alignment: Alignment.center,
            width: w.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Sign ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: w * 0.08.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.Inter,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "In",
                        style: TextStyle(
                          color: FoodiesColors.primaryColor,
                          fontSize: w * 0.08.w,
                          fontWeight: FontWeight.w900,
                          fontFamily: AppFonts.Inter,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Order food at your door",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: w * 0.035.sp,
                    fontFamily: AppFonts.Inder,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            color: FoodiesColors.cardColor,
            child: IntlPhoneField(
              controller: _mobileNumber,
              initialCountryCode: 'IN',
              initialValue: '+91',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                focusColor: Colors.grey.shade300,
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: FoodiesColors.textColor),
                ),
                counterText: "",
                labelText: "Mobile Number",
                labelStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: FoodiesColors.textColor,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: FoodiesColors.textColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: InkWell(
            onTap: () {
              if (_mobileNumber.text.isEmpty) {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.topSlide,
                  dialogType: DialogType.info,
                  title: MsgTitle.Info,
                  btnOkColor: FoodiesColors.accentColor,
                  btnOkOnPress: () {
                    Get.back();
                  },
                  desc: AppMessages.mobileNumberInfo,
                  descTextStyle:
                      const TextStyle(fontSize: FontSize.smallBodyText),
                ).show();
              } else if (_mobileNumber.text.length < 10) {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.topSlide,
                  dialogType: DialogType.info,
                  title: MsgTitle.Info,
                  btnOkColor: FoodiesColors.accentColor,
                  btnOkOnPress: () {
                    Get.back();
                  },
                  desc: AppMessages.mobileNumberLength,
                  descTextStyle:
                      const TextStyle(fontSize: FontSize.smallBodyText),
                ).show();
              } else {
                // _loginController.loginWithMobileNumber(
                //     _mobileNumber.text, context);
                Get.offAndToNamed(AppRoutes.otpVerification);
              }
            },
            // child: Obx(() => Container(
            //   margin: EdgeInsets.symmetric(horizontal: w * 0.05.w),
            //   width: w.w,
            //   height: h.h * 0.06.h,
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //     color: FoodiesColors.accentColor,
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            //   child: _loginController.isLoading.value ? const CircularProgressIndicator(color: Colors.white,)  : Text(
            //     "Get OTP",
            //     style: TextStyle(
            //       fontFamily: "Inter",
            //       fontSize: 18.sp,
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),)
              child : Container(
          margin: EdgeInsets.symmetric(horizontal: w * 0.05.w),
          width: w.w,
          height: h.h * 0.06.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: FoodiesColors.accentColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            "Get OTP",
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: h * 0.05.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(children: <Widget>[
              const Expanded(
                  child: Divider(
                thickness: 1,
                color: FoodiesColors.accentColor,
              )),
              SizedBox(
                width: 5.w,
              ),
              const Text(
                "OR",
                style: TextStyle(fontSize: FontSize.smallBodyText),
              ),
              SizedBox(
                width: 5.w,
              ),
              const Expanded(
                  child: Divider(
                thickness: 1,
                color: FoodiesColors.accentColor,
              )),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: h * 0.05.h,
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: w * 0.05.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: w * 0.05.r,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.google),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: w * 0.05.r,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.facebook),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: w * 0.05.r,
                  backgroundColor: Colors.transparent,
                  child: ClipOval(
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppAssets.tweeter),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
