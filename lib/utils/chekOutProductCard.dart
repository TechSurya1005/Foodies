import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/controllers/favController.dart';
import 'package:foodies_app/controllers/orderQntyBtn.dart';
import 'package:get/get.dart';

class CheckOutProductCard extends StatelessWidget {
  final IconData favIcon;
  final IconData disLike;
  final String image;
  final String title;
  final int qty;
  // final String size;
  final double price;
  final double rating;
  final int index;
  CheckOutProductCard(
      {super.key,
      required this.image,
      required this.title,
      required this.qty,
      required this.price,
      required this.rating,
      required this.favIcon,
      required this.disLike,
      required this.index});

  final FavoriteController favoriteController = Get.put(FavoriteController());
  OrderQtyBtn orderQtyBtn = Get.put(OrderQtyBtn());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: FoodiesColors.cardColor,
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0.5))
          ]),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
            decoration: BoxDecoration(
                color: FoodiesColors.checkPorductCardColor,
                borderRadius: BorderRadius.circular(10)),
            height: h * 0.08,
            width: w * 0.16,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.titleStyle,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: 5.r),
                  child: RatingBar.builder(
                    initialRating: rating,
                    allowHalfRating: true,
                    itemSize: 20,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    onRatingUpdate: (value) {
                      print(value);
                    },
                  ),
                ),
                Text(
                  Words.INRSymbol + "$price" + " Per Peace",
                  style: TextStyle(
                      fontSize: 14.0.h,
                      fontFamily: 'Inder',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    orderQtyBtn.qtyCheckoutDecrement(index);
                  },
                  child: Text(
                    "-",
                    style: TextStyle(
                        fontSize: FontSize.mediumBodyText.sp,
                        color: FoodiesColors.textColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Obx(
                  () => Text(
                    orderQtyBtn.checkOutQty.value.toString(),
                    style: const TextStyle(
                      color: FoodiesColors.textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    orderQtyBtn.qtyCheckoutIncrement(index);
                  },
                  child: Text(
                    "+",
                    style: TextStyle(
                        fontSize: FontSize.mediumBodyText.sp,
                        color: FoodiesColors.textColor,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
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
                            favIcon,
                            color: FoodiesColors.accentColor,
                          )
                        : Icon(
                            disLike,
                          ))),
                const Text(
                  "${Words.INRSymbol} 199.0",
                  style: AppTextStyles.titleStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
