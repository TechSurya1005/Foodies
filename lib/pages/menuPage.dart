import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/data/models/menuData.dart';
import 'package:foodies_app/utils/menPageCard.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // String title = Get.arguments.toString();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    Map<String, dynamic> args = Get.arguments;
    String menuTitle = args['menuTitle'];
    int menuId = args['menuId'];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            // elevation: 0,
            automaticallyImplyLeading: true,
            title: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                textAlign: TextAlign.left,
                overflow: TextOverflow.visible,
                menuTitle,
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: h * 0.028,
                    color: FoodiesColors.accentColor),
              ),
            ),
            iconTheme: const IconThemeData(color: FoodiesColors.accentColor),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.search,
                    color: FoodiesColors.accentColor,
                  )),
            ],
            backgroundColor: FoodiesColors.backgroundColor,
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              width: w,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FoodiesColors.card,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 0.2,
                                    spreadRadius: 0.2,
                                    offset: const Offset(0, 1))
                              ]),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green)),
                                child: const Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              const Text(
                                "Veg Only",
                                style: AppTextStyles.titleStyle,
                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: FoodiesColors.card,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    blurRadius: 0.2,
                                    spreadRadius: 0.2,
                                    offset: const Offset(0, 1))
                              ]),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.red)),
                                child: const Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 10.h,
                              ),
                              const Text(
                                "Non Veg Only",
                                style: AppTextStyles.titleStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return MenuPageCard(
                  image: menuData[index].image,
                  favicon: Icons.favorite,
                  dislike: Icons.favorite_border_outlined,
                  title: menuData[index].title,
                  food_Variety: menuData[index].itemType,
                  product: menuData[index].food_Variety,
                  price: menuData[index].Price,
                  time: menuData[index].time,
                  distance: menuData[index].distance,
                  index: index,
                );
              },
              childCount: menuData.length,
            ),
          )
        ],
      ),
    );
  }
}
