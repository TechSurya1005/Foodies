import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/main.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // late bool isLogged;
  @override
  void initState() {
    super.initState();

    if (box.read('is_logged_in') == null) {
      box.write('is_logged_in', false);
    }

    if (box.read('is_logged_in') == true) {
      Timer(const Duration(seconds: 1), () {
        Get.offNamed(AppRoutes.homeMain);
        print(box.read('is_logged_in'));
      });
    } else {
      Timer(const Duration(seconds: 1), () {
        Get.offNamed(AppRoutes.onBoarding);
        print(box.read('is_logged_in'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          height: 150,
          width: 200,
          child: Image.asset(
            AppAssets.logo,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
