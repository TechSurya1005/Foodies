import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/words.dart';

class OrderHistoryItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String subCategory;
  final String portionSize;
  final double qty;
  final double unitPrice;
  const OrderHistoryItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.subCategory,
    required this.portionSize,
    required this.qty,
    required this.unitPrice,
  });

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        // height: h * 0.1.h,
        width: w.h,
        padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: FoodiesColors.cardColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60.h,
              width: 60.w,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.contain)),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200.w,
                    child: Text(
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: TextStyle(
                          fontSize: h * 0.016.sp,
                          fontFamily: 'Inder',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: subCategory == 'Veg'
                                      ? Colors.green
                                      : FoodiesColors.accentColor)),
                          child: Icon(
                            Icons.circle,
                            color: subCategory == 'Veg'
                                ? Colors.green
                                : FoodiesColors.accentColor,
                            size: 10,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Container(
                          width: 150.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            overflow: TextOverflow.visible,
                            textAlign: TextAlign.left,
                            "$subCategory, $portionSize",
                            style: TextStyle(
                              fontSize: h * 0.014.sp,
                              fontFamily: 'Inder',
                            ),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 60.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Text(
                                  "  -  ",
                                  style: TextStyle(
                                      color: FoodiesColors.accentColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "1",
                                style: TextStyle(
                                  color: FoodiesColors.accentColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              GestureDetector(
                                child: Text(
                                  "  +  ",
                                  style: TextStyle(
                                      color: FoodiesColors.accentColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${Words.INRSymbol} $unitPrice",
                    style: TextStyle(
                        fontSize: h * 0.014.sp,
                        fontFamily: 'Inder',
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            const Spacer(),
          ],
        ));
  }
}
