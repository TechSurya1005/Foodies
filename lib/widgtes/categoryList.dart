import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/controllers/getCategoryController.dart';
import 'package:foodies_app/data/models/categoryDataModal.dart';
import 'package:foodies_app/utils/categoryCard.dart';
import 'package:get/get.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final GetCategoryController _categoryController =
      Get.put(GetCategoryController());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return SizedBox(
        height: _categoryController.allCategoryData.length < 6 ? 100.h : 200.h,
        width: w.w,
        child: Obx(
          () => GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categoryController.allCategoryData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: w * 0.02.w,
                  mainAxisSpacing: 2,
                  crossAxisCount:
                      _categoryController.allCategoryData.length < 8 ? 1 : 2,
                  mainAxisExtent: 90.w),
              shrinkWrap: false,
              itemBuilder: (BuildContext context, int index) {
                var allCategoryItem =
                    _categoryController.allCategoryData[index];
                return CategoryCard(
                  image: allCategoryItem["image"],
                  catTitle: allCategoryItem["categoryName"],
                );
              }),
        ));
  }
}
