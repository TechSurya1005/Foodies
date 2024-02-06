import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/data/models/menuModal.dart';
import 'package:foodies_app/utils/menuCard.dart';
import 'package:get/get.dart';

class MenuCardList extends StatelessWidget {
  const MenuCardList({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
      height: 200.h,
      width: w.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(0, 0.5))
          ]),
      child: ListView.builder(
        itemCount: menuList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuCard(
                image: menuList[index].image,
                categoryTitle: menuList[index].menuTitle,
                function: () {
                  Get.toNamed(
                    AppRoutes.menuPage,
                    arguments: {
                      'menuTitle': menuList[index].menuTitle,
                      'menuId': menuList[index].menuId,
                    },
                  );
                  print(menuList[index].menuId);
                },
              ),
              if (index < menuList.length - 1)
                VerticalDivider(
                  indent: 20,
                  endIndent: 20,
                  color: Colors.grey.withOpacity(0.5),
                  thickness: 1,
                )
            ],
          );
        },
      ),
    );
  }
}
