import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/widgtes/DotIndicator.dart';
import 'package:get/get.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late PageController _pageController;
  var _pageIndex = 0;
  RxString btnTitle = "Continue".obs;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        double h = constraints.maxHeight;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: h * 0.7.h,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int index) {
                        setState(() {
                          _pageIndex = index;
                          if (_pageIndex == 2) {
                            btnTitle.value = "Get Started";
                          } else {
                            btnTitle.value = "Continue";
                          }
                        });
                      },
                      children: pages,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ...List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.only(right: w * 0.02),
                        child: DotIndicator(
                          isActive: index == _pageIndex,
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: w.w,
                    height: 50.h,
                    margin: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                        if (_pageIndex == 2) {
                          Get.offNamed(AppRoutes.loginNumber);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FoodiesColors.accentColor,
                      ),
                      child: Obx(() => Text(
                            btnTitle.value,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed(AppRoutes.loginNumber);
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> pages = [
    LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        double h = constraints.maxHeight;

        return Column(
          children: [
            const Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              height: h * 0.5,
              width: w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.Jalapeno_pizza_1),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "ENJOY ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.035.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.Inter,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "DELICIOUS FOOD",
                    style: TextStyle(
                      color: FoodiesColors.primaryColor,
                      fontSize: h * 0.035.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.Inter,
                    ),
                  ),
                  TextSpan(
                    text: " IN YOUR HEALTHY LIFE.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: h * 0.035.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.Inter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "There are many variations of passages of Lorem ipsum available, but the majority have suffered alteration in some form, by injected humour.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: h * 0.025.sp,
                  fontFamily: AppFonts.Inder,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02.h,
            ),
          ],
        );
      },
    ),
    LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        double h = constraints.maxHeight;

        return Column(
          children: [
            const Spacer(),
            SizedBox(
              height: h * 0.1.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              height: h * 0.5.h,
              width: w.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.burger4),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.05.h,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "PICK ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.035.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.Inter,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: " THE FOOD",
                    style: TextStyle(
                      color: FoodiesColors.primaryColor,
                      fontSize: h * 0.035.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.Inter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Praesent auctor, elit ut consequat vulputate, ipsum odio venenatis massa, vel finibus metus tortor eget nunc.Sed auctor eget purus non interdum. Nullam id metus at elit cursus hendrerit nec in ex.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: h * 0.025.h,
                  fontFamily: AppFonts.Inder,
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02.h,
            ),
          ],
        );
      },
    ),
    LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;
        double h = constraints.maxHeight;

        return Column(
          children: [
            const Spacer(),
            SizedBox(
              height: h * 0.1.h,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              height: h * 0.4.h,
              width: w.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.foods3),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "EAT,",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: h * 0.035.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFonts.Inter,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "LOVE,",
                    style: TextStyle(
                      color: FoodiesColors.primaryColor,
                      fontSize: h * 0.035.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.Inter,
                    ),
                  ),
                  TextSpan(
                    text: " REPEAT",
                    style: TextStyle(
                      fontSize: h * 0.035.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.Inter,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "Eat, Love, Repeat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor, quam non cursus aliquet, urna nisi commodo turpis, vel commodo risus orci ac massa. Nulla facilisi. Nullam aliquam dapibus metus a viverra.",
                textAlign: TextAlign.center,
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontSize: h * 0.025.sp,
                  fontFamily: AppFonts.Inder,
                ),
              ),
            )
          ],
        );
      },
    )
  ];
}
