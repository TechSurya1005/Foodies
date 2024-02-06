import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';

class BestDealsToday extends StatefulWidget {
  const BestDealsToday({super.key});

  @override
  State<BestDealsToday> createState() => _BestDealsTodayState();
}

class _BestDealsTodayState extends State<BestDealsToday> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      height: h * 0.4,
      margin: const EdgeInsets.only(left: 15, right: 10, bottom: 10),
      decoration: BoxDecoration(
          color: FoodiesColors.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                blurRadius: 0.2,
                spreadRadius: 0.2,
                color: Colors.black.withOpacity(0.3),
                offset: Offset(0, 2))
          ]),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage(AppAssets.pizza),
              ),
              title: const Text(
                "Cheese Pizza",
                style: AppTextStyles.titleStyle,
              ),
              subtitle: Row(
                children: [
                  const Text(
                    "4.9",
                    style: TextStyle(fontSize: FontSize.smallBodyText),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.orange,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.orange,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.orange,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.orange,
                  ),
                  const Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.orange,
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  const Text(
                    "(429)",
                    style: TextStyle(fontSize: 13),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Text(
                    "₹ 225",
                    style: TextStyle(
                        fontSize: FontSize.smallBodyText,
                        color: FoodiesColors.accentColor,
                        fontFamily: 'Inder'),
                  )
                ],
              ),
            );
          })),
    );
  }
}
