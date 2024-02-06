import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/utils/popularItemsCard.dart';
import 'package:get/get.dart';

class PopularItemList extends StatefulWidget {
  const PopularItemList({super.key});

  @override
  State<PopularItemList> createState() => _PopularItemListState();
}

class _PopularItemListState extends State<PopularItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10.r),
      height: 350.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Get.toNamed(AppRoutes.foodDetails,
                  arguments: " background + $index");
            },
            child: PopularItemCard(
              favIcon: Icons.favorite,
              disLike: Icons.favorite_border_outlined,
              ratIcon: Icons.star,
              itemRating: 4.4,
              image: AppAssets.pizza_ai1,
              itemTitle: "Chicken Pizza",
              itemDetails: "There are many variations of purpose"
                  "available, but the majority have suffer.",
              itemPrice: 125.00,
              tag: 'background + ${index}',
              index: index,
            ),
          );
        },
      ),
    );
  }
}
