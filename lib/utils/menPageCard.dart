import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/controllers/favController.dart';
import 'package:get/get.dart';

class MenuPageCard extends StatelessWidget {
  final String image;
  final IconData favicon;
  final IconData dislike;
  final String title;
  final String food_Variety;
  final String product;
  final double price;
  final String time;
  final int distance;
  final int index;
  MenuPageCard(
      {super.key,
      required this.image,
      required this.favicon,
      required this.dislike,
      required this.title,
      required this.food_Variety,
      required this.product,
      required this.price,
      required this.time,
      required this.distance,
      required this.index});

  final FavoriteController favoriteController = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: h * 0.4,
      width: w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: FoodiesColors.cardColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0.5))
          ]),
      child: Column(
        children: [
          Container(
            height: h * 0.25,
            width: w,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: FoodiesColors.cardBackground,
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => IconButton(
                    onPressed: () {
                      if (favoriteController.isFavorite(index) == true) {
                        favoriteController.toggleRemoveFavorite(index);
                      } else {
                        favoriteController.toggleAddFavorite(index);
                      }
                    },
                    icon: favoriteController.isFavorite(index)
                        ? Icon(
                            favicon,
                            color: FoodiesColors.accentColor,
                          )
                        : Icon(
                            dislike,
                          ))),
              ],
            ),
          ),
          Container(
            height: h * 0.15,
            width: w,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.homeTitleStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food_Variety),
                        Icon(
                          Icons.circle,
                          size: 5,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Text(product),
                        Icon(
                          Icons.circle,
                          size: 5,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Text("${Words.INRSymbol} $price ")
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.timer_outlined,
                          size: 20,
                          color: Colors.green,
                        ),
                        Text(" $time min "),
                        Icon(
                          Icons.circle,
                          size: 5,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        Text(" $distance Km")
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        print("Addes");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 0.2,
                                  spreadRadius: 0.2,
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(0, 0.5))
                            ],
                            border: Border.all(
                                width: 2, color: FoodiesColors.accentColor),
                            color: FoodiesColors.cardBackground),
                        child: Text(
                          "Add  +",
                          style: TextStyle(
                              fontSize: FontSize.mediumBodyText,
                              color: FoodiesColors.accentColor,
                              fontFamily: "Inter"),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
