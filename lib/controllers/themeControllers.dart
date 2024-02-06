import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeControllers extends GetxController {
  Rx<ThemeMode> _themeMode = ThemeMode.light.obs;

  ThemeMode get themeMode => _themeMode.value;

  void setTheme(themeMode) {
    if (_themeMode != themeMode) {
      _themeMode = _themeMode;
      update();
    }
  }


}
