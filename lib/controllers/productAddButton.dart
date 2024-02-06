import 'package:get/get.dart';

class AddProductButton extends GetxController {
  RxList tempProductData = [].obs;

  onAddProduct(int index) {
    if (!tempProductData.contains(index)) {
      tempProductData.add(index);
      print("added item $index");
      update();
    }
  }

  onRemoveProduct(int index) {
    if (tempProductData.contains(index)) {
      tempProductData.remove(index);
      print("removed item $index");
      update();
    }
  }

  bool isDataAdded(int index) {
    return tempProductData.contains(index);
  }
}
