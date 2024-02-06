import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/data/models/menuModal.dart';
import 'package:foodies_app/utils/menuCard.dart';
import 'package:foodies_app/utils/popularItemsCard.dart';
import 'package:foodies_app/widgtes/categoryList.dart';
import 'package:foodies_app/widgtes/categoryList2.dart';
import 'package:foodies_app/widgtes/menuCardLists.dart';
import 'package:foodies_app/widgtes/poductsList.dart';
import 'package:foodies_app/widgtes/popularItemList.dart';

class HomeSkeleton extends StatelessWidget {
  const HomeSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    List imageList = [
      {"id": 1, "image_path": AppAssets.banner1},
      {"id": 2, "image_path": AppAssets.banner2},
      {"id": 3, "image_path": AppAssets.banner3},
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 100.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 10),
            width: w.w,
            decoration: BoxDecoration(
                color: FoodiesColors.backgroundColor,
                borderRadius: BorderRadius.circular(15.r)),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              right: 10.r,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
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
                              child: Row(
                                children: [
                                  Image(
                                    image: const AssetImage(AppAssets.offer1),
                                    fit: BoxFit.contain,
                                    height: 40.h,
                                    width: 40.h,
                                  ),
                                  const Text("  Cheese Burger",
                                      style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
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
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Image(
                                    image: const AssetImage(AppAssets.offer4),
                                    fit: BoxFit.contain,
                                    height: 40.h,
                                    width: 40.h,
                                  ),
                                  const Text("  Corn Pizza",
                                      style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
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
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10.h,
                                  ),
                                  Image(
                                    image: const AssetImage(AppAssets.offer2),
                                    fit: BoxFit.contain,
                                    height: 40.h,
                                    width: 40.h,
                                  ),
                                  const Text("  Paneer Pizza",
                                      style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600))
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0.r),
              child: InkWell(
                child: CarouselSlider(
                  items: imageList
                      .map((item) => Image.asset(
                            item['image_path'],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ))
                      .toList(),
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    viewportFraction: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 15, top: 10),
            alignment: Alignment.centerLeft,
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          padding: EdgeInsets.only(right: 10.r),
          height: MediaQuery.of(context).size.height * 0.40.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
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
        )),
      ],
    );
  }
}
