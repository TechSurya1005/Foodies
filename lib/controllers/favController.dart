import 'package:get/get.dart';

class FavoriteController extends GetxController {
  RxList favs = [].obs;

  void toggleAddFavorite(int item) {
    favs.add(item);
    update();
  }

  void toggleRemoveFavorite(int item) {
    favs.remove(item);
    update();
  }

  bool isFavorite(int item) {
    return favs.contains(item);
  }
}
