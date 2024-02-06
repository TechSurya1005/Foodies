import 'package:flutter/material.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerController extends GetxController {
  DateTime selectedDate = DateTime(1990, 1, 1);
  DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  RxString formattedDate = ''.obs;

  @override
  void onInit() {
    super.onInit();
    formattedDate.value = dateFormat.format(selectedDate);
  }

  void showDatePicker() async {
    final value = await Get.defaultDialog<DateTime>(
      barrierDismissible: false,
      title: 'Select a Date',
      content: SizedBox(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: DateTime(1990),
                lastDate: DateTime(2025),
                onDateChanged: (newDate) {
                  selectedDate = newDate;
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(FoodiesColors.accentColor),
              ),
              onPressed: () {
                Get.back(result: selectedDate);
              },
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );

    if (value != null) {
      selectedDate = value;
      formattedDate.value = dateFormat.format(selectedDate);
    }
  }
}
