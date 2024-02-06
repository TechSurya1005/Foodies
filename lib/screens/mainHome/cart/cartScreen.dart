import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/data/models/addressModal.dart';
import 'package:foodies_app/utils/addresscard.dart';
import 'package:foodies_app/utils/cartCard.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final int items = 2;
  bool isCoupon = true;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    print("Carts : $items");

    return Scaffold(
        appBar: AppBar(
          backgroundColor: FoodiesColors.cardColor,
          centerTitle: true,
          title: Text(
            "Cart",
            style: TextStyle(
                color: FoodiesColors.textColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                // width: w.w,
                child: items > 0
                    ? Column(
                        children: List.generate(items, (index) {
                          return CartCard(
                            image: AppAssets.Jalapeno_pizza_1,
                            title: "Jalapeno pizza",
                            variant: "Spicy chicken pizza",
                            portionSize: 'Regular',
                            qty: index + 1,
                            price: 159.0,
                          );
                        }),
                      )
                    : Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            const Icon(
                              CupertinoIcons.cart,
                              color: FoodiesColors.accentColor,
                              size: 50,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              "Your cart is empty",
                              style: TextStyle(
                                  color: FoodiesColors.textColor,
                                  fontSize: 18.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: FoodiesColors.accentColor,
                                ),
                                child: Text(
                                  "Add Food Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
                child: isCoupon == true
                    ? null
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 250.w,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: "Promo Code",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 15.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: FoodiesColors.accentColor),
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter"),
                            ),
                          )
                        ],
                      )),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
            SliverToBoxAdapter(
                child: items > 0
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            color: FoodiesColors.cardColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Price Details ($items Items)",
                                  style: AppTextStyles.homeTitleStyle,
                                )),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: Column(
                                children: [
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total MRP",
                                        style: AppTextStyles.titleStyle,
                                      ),
                                      Text("${Words.INRSymbol} 597",
                                          style: AppTextStyles.titleStyle),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Discount on MRP",
                                        style: AppTextStyles.titleStyle,
                                      ),
                                      Text("${Words.INRSymbol} -3",
                                          style: AppTextStyles.titleStyle),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        isCoupon == true
                                            ? "Coupon  (CH7STRS)"
                                            : "Coupon Code",
                                        style: TextStyle(
                                          fontFamily: 'Inder',
                                          fontSize: 14.sp,
                                          color: isCoupon == true
                                              ? FoodiesColors.accentColor
                                              : FoodiesColors.textColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          print("Coupon Code");
                                        },
                                        child: Text(
                                            isCoupon == true
                                                ? "${Words.INRSymbol} -25"
                                                : "Apply Coupon",
                                            style: TextStyle(
                                                color:
                                                    FoodiesColors.accentColor,
                                                fontSize: 14.sp)),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Convenience Fee",
                                        style: AppTextStyles.titleStyle,
                                      ),
                                      Text("${Words.INRSymbol} 99",
                                          style: AppTextStyles.titleStyle),
                                    ],
                                  ),
                                  const Divider(
                                    color: FoodiesColors.textColor,
                                    thickness: 2,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: AppTextStyles.titleStyle,
                                      ),
                                      Text("${Words.INRSymbol} 696",
                                          style: AppTextStyles.titleStyle),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : null),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20.h,
              ),
            ),
          ],
        ),
        bottomNavigationBar: items > 0
            ? Container(
                height: 150.h,
                width: w.w,
                margin: EdgeInsets.all(10.0.w.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: FoodiesColors.cardBackground),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5.w.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundColor: FoodiesColors.cardColor,
                            child: Icon(
                              Icons.location_on,
                              color: FoodiesColors.accentColor,
                              size: 27,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          SizedBox(
                            width: 220.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Delivery to Civil Lines",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                      fontFamily: 'Inder',
                                      fontSize: 14.0.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "2nd Floor, Govind Kunj, Programmics Technology Raipur,492001",
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(
                                    fontFamily: 'Inder',
                                    fontSize: 12.0.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () => showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return selectAddress();
                              },
                            ),
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                "Change",
                                style: TextStyle(
                                    color: FoodiesColors.accentColor,
                                    fontFamily: 'Inder',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.0.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 5,
                      endIndent: 5,
                      thickness: 1,
                      color: FoodiesColors.accentColor,
                    ),
                    InkWell(
                      onTap: () => Get.toNamed(AppRoutes.checkOutDetails),
                      child: Container(
                        alignment: Alignment.center,
                        width: w.w,
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            color: FoodiesColors.accentColor,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Text(
                          "SELECT PAYMENT MODE",
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : null);
  }

  Widget selectAddress() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        child: Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                // height: h * 0.5,
                width: w.w,
                decoration: BoxDecoration(
                    color: FoodiesColors.cardBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(0, -0.25))
                    ]),
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.only(top: 20.h, left: 20.w, bottom: 10.h),
                      child: const Center(
                        child: Text(
                          "Select an address",
                          style: AppTextStyles.homeTitleStyle,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 10,
                      endIndent: 10,
                      color: FoodiesColors.accentColor,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        decoration: BoxDecoration(
                          color: FoodiesColors.cardColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.plus,
                              color: FoodiesColors.accentColor,
                              // size: 25,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Text(
                              "Add Address",
                              style: TextStyle(
                                color: FoodiesColors.accentColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.forward,
                              color: FoodiesColors.textColor.withOpacity(0.5),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Saved Addresses",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Wrap(
                      children: addressData.map((item) {
                        return AddressCard(
                            addressId: item.addressId,
                            addressStatus: item.addressStatus,
                            addressType: item.addressType,
                            actualAddress: item.actualAddress,
                            areaAddress: item.areaAddress,
                            landmark: item.landmark,
                            addressDistance: item.addressDistance);
                      }).toList(),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
