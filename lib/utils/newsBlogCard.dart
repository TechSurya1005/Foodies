import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';

class NewsBlogCard extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  final String date;
  final IconData saveIcon;
  final IconData unsaveIcon;

  const NewsBlogCard(
      {super.key,
      required this.title,
      required this.image,
      required this.desc,
      required this.date,
      required this.saveIcon,
      required this.unsaveIcon});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.r),
        // padding:
        //     EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
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
              height: h * 0.45.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Container(
              // height: h * 0.10,
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
              decoration: BoxDecoration(
                  color: FoodiesColors.cardColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: FoodiesColors.accentColor,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: FoodiesColors.textColor),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      const Icon(
                        Icons.bookmark_border_outlined,
                        color: FoodiesColors.accentColor,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: FoodiesColors.textColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16..sp,
                        fontWeight: FontWeight.w500,
                        color: FoodiesColors.textColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
