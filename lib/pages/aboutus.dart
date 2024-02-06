import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:video_player/video_player.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  late VideoPlayerController _Videocontroller;
  @override
  void initState() {
    _Videocontroller =
        VideoPlayerController.asset("assets/images/samplevideo.mp4")
          ..initialize().then((value) {
            setState(() {
              _Videocontroller.play();
            });
          });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _Videocontroller.dispose();
  }

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
          "About Us",
          style: AppTextStyles.homeTitleStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.r),
            alignment: Alignment.center,
            child: Text(
              "Who are we ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.sp,
                fontFamily: AppFonts.Inter,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.r, right: 10.r, left: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: FoodiesColors.accentColor),
            child: Text(
              "Our History",
              style: TextStyle(
                color: FoodiesColors.cardColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.Inter,
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            width: w * 0.30.w,
            height: h * 0.30.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/aboutchef1.png'),
                    fit: BoxFit.contain)),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.r),
              alignment: Alignment.center,
              child: Text(
                "Origins of the restorent",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  fontFamily: AppFonts.Inter,
                ),
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.justify,
                "Nunc quam nibh diam in eget. Tortor amet, eleifend sed viverra ac eu porta netus pulvinar,Quis sem donec pharetra viverra consectetur aliquam, platea egestas, Egestas quis fringillacursus nullam. Nisl vulputate aliquam odio massa mattis.\n\n We share knowledge and skills with passion, which is why the Alimentarium organizes daily culinary workshops and classes led by qualified chefs. We are dedicated to providing a platform for learning and skill development. Our goal is to offer you the opportunity to enhance your culinary expertise and knowledge in an engaging and immersive environment.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.Inder,
                ),
              )),
          Container(
            width: w * 0.30.w,
            height: h * 0.30.h,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/chef3.png'),
                    fit: BoxFit.contain)),
          ),
          Container(
              margin: EdgeInsets.only(top: 20.r),
              alignment: Alignment.center,
              child: Text(
                "Why choose us ?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                  fontFamily: AppFonts.Inter,
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 10.r, right: 10.r, left: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: FoodiesColors.accentColor),
            child: Text(
              "Why we are the best",
              style: TextStyle(
                color: FoodiesColors.cardColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.Inter,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.justify,
                "A, blandit euismod ullamcorper vestibulum enim habitasse. Ultrices tincidunt Scelerisque elit enim. A neque malesuada in tortor eget justo mauris nec dolor. Consequat risus vitae, ac ac et preparation, He wanted to serve burgers, friend and beverages that tasted.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.Inder,
                ),
              )),
          Container(
            height: h * 0.35,
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: FoodiesColors.cardColor,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0.5))
                      ]),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png/fresh_food.png',
                        height: 25.h,
                        width: 25.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Fresh Food",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: AppFonts.Inter),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: FoodiesColors.cardColor,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0.5))
                      ]),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png/del_truck.png',
                        height: 25.h,
                        width: 25.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("Fast Delivery Food",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.Inter))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: FoodiesColors.cardColor,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0.5))
                      ]),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png/quality.png',
                        height: 25.h,
                        width: 25.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("Quality Maintain",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.Inter))
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: FoodiesColors.cardColor,
                      borderRadius: BorderRadius.circular(5.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 0.2,
                            spreadRadius: 0.2,
                            color: Colors.black.withOpacity(0.3),
                            offset: const Offset(0, 0.5))
                      ]),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.r, vertical: 15.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png/call_service.png',
                        height: 25.h,
                        width: 25.w,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text("24/7 Support",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: AppFonts.Inter))
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: w,
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            child: _Videocontroller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _Videocontroller.value.aspectRatio,
                    child: VideoPlayer(_Videocontroller),
                  )
                : Container(),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                '“We have no regrets! I don’t Know what else to say. it really saves me time and effort. Food is exactly what our business has been lacking”',
                style: TextStyle(
                  color: FoodiesColors.textColor.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: AppFonts.Inder,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Customer",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: FoodiesColors.textColor,
                        fontSize: 22.sp,
                      ),
                    ),
                    TextSpan(text: "  "),
                    TextSpan(
                      text: "Feedback",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        color: FoodiesColors.accentColor,
                        fontSize: 22.sp,
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.justify,
                "Been a life saver for keeping our sanity during the pandemic, although they could improve some of their ui and how they handle specials as it often is unclear how to use them or everything is sold out so fast it feels a bit bait and switch. Still I'd be stir crazy and losing track of days without so...",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  fontFamily: AppFonts.Inder,
                ),
              )),
          SizedBox(
            height: 10.h,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r),
              child: Image.asset("assets/images/chef1.png")),
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.r, right: 10.r, left: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: FoodiesColors.accentColor),
            child: Text(
              "What Makes Us the Preferred Choice ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: FoodiesColors.cardColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                fontFamily: AppFonts.Inter,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: h * 0.3.h,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 20.r),
            child: ListView(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: FoodiesColors.cardColor,
                      radius: 25,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/png/burger_ai_png.png",
                          height: 50.h,
                          width: 50.h,
                        ),
                      ),
                    ),
                    Container(
                      width: w * 0.75,
                      margin: EdgeInsets.symmetric(horizontal: 10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            "Choose your favorite",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.visible,
                            "There are many variations Passages but"
                            "the majority have alteration in some form.",
                            style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: FoodiesColors.cardColor,
                      radius: 25,
                      child: ClipOval(
                        child: Image.asset(
                          "assets/png/d_boy.png",
                          height: 50.h,
                          width: 50.h,
                        ),
                      ),
                    ),
                    Container(
                      width: w * 0.75,
                      margin: EdgeInsets.symmetric(horizontal: 10.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textAlign: TextAlign.left,
                            "We Deliver Your Meals",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.visible,
                            "There are many variations Passages but"
                            "the majority have alteration in some form.",
                            style: TextStyle(
                              fontFamily: 'Inder',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: FoodiesColors.cardColor,
                        radius: 25,
                        child: ClipOval(
                          child: Image.asset(
                            "assets/png/spoon_icon.png",
                            height: 50.h,
                            width: 50.h,
                          ),
                        ),
                      ),
                      Container(
                        width: w,
                        margin: EdgeInsets.symmetric(horizontal: 10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.left,
                              "Your Meals, Our Dedication",
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.visible,
                              "There are many variations Passages but"
                              "the majority have alteration in some form.",
                              style: TextStyle(
                                fontFamily: 'Inder',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r),
              child: Image.asset("assets/png/noodles2.png")),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}
