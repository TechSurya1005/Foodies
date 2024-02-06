import 'package:get/get.dart';

class OptionController extends GetxController {
  RxString selectedOption = "Regular".obs;

  void changeOption(String option) {
    selectedOption.value = option;
    update();
  }

  RxString selectedPayMode = "Cash".obs;

  void changePayMode(String option) {
    selectedPayMode.value = option;
    update();
  }
}
