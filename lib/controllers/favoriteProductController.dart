import 'package:get/get.dart';

class FavoriteProductController extends GetxController {
  RxList favsProduct = [].obs;

  void toggleAddFavorite(int item) {
    favsProduct.add(item);
    update();
  }

  void toggleRemoveFavorite(int item) {
    favsProduct.remove(item);
    update();
  }

  bool isFavorite(int item) {
    return favsProduct.contains(item);
  }
}
