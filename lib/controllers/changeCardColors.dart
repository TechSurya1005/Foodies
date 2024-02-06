import 'package:get/get.dart';

class ChangeCardColors extends GetxController {
  RxList suggest = [].obs;

  void toggleAddSuggested(int item) {
    suggest.add(item);
    update();
  }

  void toggleRemoveSuggested(int item) {
    suggest.remove(item);
    update();
  }

  bool isSuggested(int item) {
    return suggest.contains(item);
  }
}
