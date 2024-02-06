import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimePickerController extends GetxController {
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  void setTime(TimeOfDay newTime) {
    selectedTime.value = newTime;
    print(newTime);
  }
}
