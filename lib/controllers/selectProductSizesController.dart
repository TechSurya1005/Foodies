import 'package:get/get.dart';

class SelectProductSizeController extends GetxController {
  var selectedSize = "Size".obs;

  onChanged(var newValue) {
    selectedSize = newValue;
    update();
  }
}
