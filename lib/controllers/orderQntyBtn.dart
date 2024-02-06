import 'package:foodies_app/controllers/productAddButton.dart';
import 'package:foodies_app/data/models/allFood.dart';
import 'package:get/get.dart';

class OrderQtyBtn extends GetxController {
  RxInt Qty = 1.obs;

  void qtyIncrement() {
    Qty++;

    update();
  }

  void qtyDecrement() {
    if (Qty != 1) {
      Qty--;
    }
    update();
  }

  RxInt checkOutQty = 1.obs;

  void qtyCheckoutIncrement(int item) {
    checkOutQty++;

    update();
  }

  void qtyCheckoutDecrement(int item) {
    if (checkOutQty != 1) {
      checkOutQty--;
      update();
    }
  }

  RxInt totalPrice = 0.obs;

  RxInt total = 0.obs;

  void calculateTotalPrice() {
    int total = 0;
    for (int i = 0; i < allFodData.length; i++) {
      total += (allFodData[i].price * quantities[i]) as int;
    }
    totalPrice.value = total;
    print(totalPrice.value);
  }

  RxInt totalQty = 0.obs;

  void calculateTotalQty() {
    int totalItemQty = 0;

    for (int i = 0; i < quantities.length; i++) {
      totalItemQty += quantities[i];
    }

    totalQty.value = totalItemQty;
    print(totalQty.value);
  }

  RxList<int> quantities = List.generate(allFodData.length, (index) => 0).obs;

  void qtyProductHomeIncrement(int item) {
    quantities[item]++;
    calculateTotalQty();
    update();
  }

  void qtyProductHomeDecrement(int item) {
    if (quantities[item] > 0) {
      quantities[item]--;
      update();
    }
  }
}
