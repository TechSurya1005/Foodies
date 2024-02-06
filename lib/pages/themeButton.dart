import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/controllers/themeControllers.dart';
import 'package:get/get.dart';

import '../constants/appTextStyles.dart';
import '../constants/colors.dart';

class ThemeChangeButton extends StatefulWidget {
  const ThemeChangeButton({super.key});

  @override
  State<ThemeChangeButton> createState() => _ThemeChangeButtonState();
}

class _ThemeChangeButtonState extends State<ThemeChangeButton> {
  final _themeControllers = Get.put(ThemeControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FoodiesColors.cardBackground,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Theme",
          style: AppTextStyles.homeTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Obx(() => Column(
        children: [
          RadioListTile.adaptive(
            title: Text(
              "Light Mode",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            value: ThemeMode.light,
            groupValue: _themeControllers.themeMode,
            onChanged: (value) {
              print(value);
              _themeControllers.setTheme(ThemeMode.light);
            },
            activeColor: FoodiesColors.accentColor,
          ),
          RadioListTile.adaptive(
            title: Text(
              "Dark Mode",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            value: ThemeMode.dark,
            groupValue: _themeControllers.themeMode,
            onChanged: (value) {
              print(value);
              _themeControllers.setTheme(ThemeMode.dark);
            },
            activeColor: FoodiesColors.accentColor,
          ),
          RadioListTile.adaptive(
            title: Text(
              "System Mode",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            value: ThemeMode.system,
            groupValue: _themeControllers.themeMode,
            onChanged: (value) {
              print(value);
              _themeControllers.setTheme(ThemeMode.system);
            },
            activeColor: FoodiesColors.accentColor,
          )
        ],
      )),
    );
  }
}
