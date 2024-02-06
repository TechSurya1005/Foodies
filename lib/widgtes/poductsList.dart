import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/controllers/getCategoryController.dart';
import 'package:foodies_app/data/models/allFood.dart';
import 'package:foodies_app/utils/poductCard.dart';
import 'package:get/get.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  GetCategoryController _categoryController = Get.put(GetCategoryController());

  @override
  void initState() {
    // _categoryController.fetchCategories(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.all(15.0.r),
            child: ProductCard(
              favIcon: Icons.favorite,
              productTitle: allFodData[index].foodTitle,
              image: allFodData[index].images,
              price: allFodData[index].price,
              productDesc:
                  "Margherita Pizza features a thin crust topped with three basic ingredients: fresh tomato sauce, mozzarella cheese, and fresh basil leaves.",
              rating: allFodData[index].ratings,
              disLike: Icons.favorite_border_outlined,
              index: index,
            ),
          );
        },
        childCount: allFodData.length,
      ),
    );
  }
}
