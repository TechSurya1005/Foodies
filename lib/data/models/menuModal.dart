import 'package:foodies_app/constants/assets.dart';

class MenuModal {
  int menuId;

  String image;
  String menuTitle;
  String menuDesc;

  MenuModal(
      {required this.menuId,
      required this.image,
      required this.menuTitle,
      required this.menuDesc});
}

List<MenuModal> menuList = [
  MenuModal(
      menuId: 1,
      image: AppAssets.sushi1,
      menuTitle: 'Tasty Sushi',
      menuDesc: "There are many variations of"
          "passage of available, but the"
          "majority have suffer"),
  MenuModal(
      menuId: 2,
      image: AppAssets.popcorn,
      menuTitle: 'French Fries',
      menuDesc: "There are many variations of"
          "passage of available, but the"
          "majority have suffer"),
  MenuModal(
      menuId: 3,
      image: AppAssets.seak1,
      menuTitle: 'Hot Barbecue',
      menuDesc: "There are many variations of"
          "passage of available, but the"
          "majority have suffer"),
];
