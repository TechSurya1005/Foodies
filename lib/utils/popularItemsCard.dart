import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/controllers/favController.dart';
import 'package:get/get.dart';

class PopularItemCard extends StatelessWidget {
  final IconData favIcon;
  final IconData disLike;
  final int index;
  final IconData ratIcon;
  final double itemRating;
  final double itemPrice;
  final String image;
  final String itemTitle;
  final String itemDetails;
  final String tag;
  PopularItemCard(
      {super.key,
      required this.favIcon,
      required this.ratIcon,
      required this.image,
      required this.itemTitle,
      required this.itemDetails,
      required this.itemRating,
      required this.itemPrice,
      required this.tag,
      required this.disLike,
      required this.index});

  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      width: w * 0.55.w,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 0.5))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      ratIcon,
                      size: 20,
                      color: Colors.yellow,
                    ),
                    Text(
                      itemRating.toString(),
                      style: AppTextStyles.paragraphStyle,
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(),
            child: Image.asset(
              AppAssets.pizza_ai1,
              fit: BoxFit.contain,
              height: 130.h,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: Text(
              itemTitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
                color: FoodiesColors.textColor,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                itemDetails,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Inter',
                  color: FoodiesColors.textColor,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h),
            alignment: Alignment.center,
            child: Text(
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              "₹ $itemPrice",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inder',
                color: FoodiesColors.accentColor,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
