import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/controllers/favoriteProductController.dart';
import 'package:foodies_app/controllers/orderQntyBtn.dart';
import 'package:foodies_app/controllers/productAddButton.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final IconData favIcon;
  final IconData disLike;
  final String productTitle;
  final String productDesc;
  final String image;
  final double price;
  final double rating;
  final CallbackAction? function;
  final int index;
  ProductCard(
      {super.key,
      required this.productTitle,
      required this.productDesc,
      required this.image,
      required this.price,
      required this.rating,
      this.function,
      required this.favIcon,
      required this.disLike,
      required this.index});

  final FavoriteProductController favoriteController =
      Get.put(FavoriteProductController());

  final AddProductButton _addProductButton = Get.put(AddProductButton());

  final OrderQtyBtn _orderQtyBtn = Get.put(OrderQtyBtn());

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        decoration: BoxDecoration(
            color: FoodiesColors.cardColor,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                  blurRadius: 0.2,
                  spreadRadius: 0.2,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 0.5))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  child: Obx(() => IconButton(
                      onPressed: () {
                        if (favoriteController.isFavorite(index) == true) {
                          favoriteController.toggleRemoveFavorite(index);
                        } else {
                          favoriteController.toggleAddFavorite(index);
                        }
                      },
                      icon: favoriteController.isFavorite(index)
                          ? Icon(
                              favIcon,
                              color: FoodiesColors.accentColor,
                            )
                          : Icon(
                              disLike,
                            ))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: h * 0.25.h,
                  width: w * 0.55.w,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.contain)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Text(
                    productTitle,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.justify,
                    productDesc,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Inder"),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "₹ $price",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inder',
                              color: FoodiesColors.accentColor,
                            ),
                          ),
                          SizedBox(
                            child: RatingBar.builder(
                              itemSize: 20,
                              initialRating: rating,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              tapOnlyMode: true,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ),
                          Obx(() => InkWell(
                                onTap: () {
                                  if (!_addProductButton.tempProductData
                                      .contains(index)) {
                                    _addProductButton.onAddProduct(index);
                                    if (_orderQtyBtn.quantities[index] == 0) {
                                      _orderQtyBtn
                                          .qtyProductHomeIncrement(index);
                                    }
                                  }
                                },
                                child: !_addProductButton.isDataAdded(index) ||
                                        _orderQtyBtn.quantities[index] == 0
                                    ? Container(
                                        width: 80.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                          left: 10.w,
                                          right: 10.w,
                                          top: 10.h,
                                          bottom: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FoodiesColors.accentColor,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Text(
                                          "Add",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 100.w,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                          left: 10.w,
                                          right: 10.w,
                                          top: 10.h,
                                          bottom: 10.h,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: FoodiesColors.accentColor),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  if (_orderQtyBtn
                                                          .quantities[index] ==
                                                      0) {
                                                    print(
                                                        "Can't be less than zero");
                                                  } else {
                                                    _orderQtyBtn
                                                        .qtyProductHomeDecrement(
                                                            index);
                                                    _orderQtyBtn
                                                        .calculateTotalQty();
                                                    if (_orderQtyBtn.quantities[
                                                            index] ==
                                                        0) {
                                                      _addProductButton
                                                          .onRemoveProduct(
                                                              index);
                                                    }
                                                  }
                                                },
                                                child: Image.asset(
                                                  'assets/png/minus.png',
                                                  color:
                                                      FoodiesColors.accentColor,
                                                  height: 20.h,
                                                  width: 15.w,
                                                )),
                                            Obx(() => Text(
                                                  _orderQtyBtn.quantities[index]
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    color: FoodiesColors
                                                        .accentColor,
                                                  ),
                                                )),
                                            InkWell(
                                                onTap: () {
                                                  _orderQtyBtn
                                                      .qtyProductHomeIncrement(
                                                          index);

                                                  _orderQtyBtn
                                                      .calculateTotalQty();
                                                },
                                                child: Image.asset(
                                                  'assets/png/plus.png',
                                                  color:
                                                      FoodiesColors.accentColor,
                                                  height: 20.h,
                                                  width: 15.w,
                                                )),
                                          ],
                                        ),
                                      ),
                              ))
                        ]))
              ]),
        ));
  }
}



//for product bottom sheet

//  showModalBottomSheet(
//                                       backgroundColor: Colors.transparent,
//                                       context: context,
//                                       builder: (context) => Stack(
//                                             children: [
//                                               Positioned(
//                                                 bottom: 0,
//                                                 left: 0,
//                                                 right: 0,
//                                                 child: Column(
//                                                   children: [
//                                                     // CircleAvatar(
//                                                     //   backgroundColor: Colors
//                                                     //       .black
//                                                     //       .withOpacity(0.5),
//                                                     //   child: IconButton(
//                                                     //     onPressed: () {
//                                                     //       Get.back();
//                                                     //     },
//                                                     //     icon: const Icon(
//                                                     //       Icons.close,
//                                                     //       color: Colors.white,
//                                                     //     ),
//                                                     //   ),
//                                                     // ),
//                                                     // SizedBox(
//                                                     //   height: 10.h,
//                                                     // ),
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               20.0),
//                                                       child: Container(
//                                                         width: w.w,
//                                                         decoration: BoxDecoration(
//                                                             color: FoodiesColors
//                                                                 .cardBackground,
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         15.r),
//                                                             boxShadow: [
//                                                               BoxShadow(
//                                                                   blurRadius:
//                                                                       0.5,
//                                                                   spreadRadius:
//                                                                       0.5,
//                                                                   color: Colors
//                                                                       .black
//                                                                       .withOpacity(
//                                                                           0.3),
//                                                                   offset:
//                                                                       const Offset(
//                                                                           0,
//                                                                           -0.25))
//                                                             ]),
//                                                         child: Column(
//                                                           children: [
//                                                             Container(
//                                                               alignment: Alignment
//                                                                   .centerLeft,
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       top: 20.h,
//                                                                       left:
//                                                                           20.w,
//                                                                       bottom:
//                                                                           10.h),
//                                                               child: const Text(
//                                                                 "Select Sizes",
//                                                                 style: AppTextStyles
//                                                                     .homeTitleStyle,
//                                                               ),
//                                                             ),
//                                                             const Divider(
//                                                               thickness: 1,
//                                                               indent: 10,
//                                                               endIndent: 10,
//                                                               color: FoodiesColors
//                                                                   .accentColor,
//                                                             ),
                                                            
//                                                             const Divider(
//                                                               thickness: 1,
//                                                               indent: 10,
//                                                               endIndent: 10,
//                                                               color: FoodiesColors
//                                                                   .accentColor,
//                                                             ),
//                                                             Container(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       left:
//                                                                           15.w,
//                                                                       right:
//                                                                           20.h),
//                                                               child: Row(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .spaceBetween,
//                                                                 children: [
//                                                                   TextButton(
//                                                                       onPressed:
//                                                                           () {},
//                                                                       child:
//                                                                           Text(
//                                                                         "Clear All",
//                                                                         style: TextStyle(
//                                                                             fontFamily:
//                                                                                 'Inter',
//                                                                             fontSize:
//                                                                                 16.sp,
//                                                                             color: FoodiesColors.accentColor,
//                                                                             fontWeight: FontWeight.bold),
//                                                                       )),
//                                                                   InkWell(
//                                                                     onTap: () =>
//                                                                         Get.back(),
//                                                                     child:
//                                                                         Container(
//                                                                       padding: EdgeInsets.only(
//                                                                           top: 10
//                                                                               .h,
//                                                                           left: 15
//                                                                               .w,
//                                                                           right: 15
//                                                                               .w,
//                                                                           bottom:
//                                                                               10.h),
//                                                                       decoration: BoxDecoration(
//                                                                           borderRadius: BorderRadius.circular(15
//                                                                               .r),
//                                                                           color:
//                                                                               FoodiesColors.accentColor),
//                                                                       child:
//                                                                           Text(
//                                                                         "Add Product",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 FoodiesColors.cardColor,
//                                                                             fontSize: 16.sp,
//                                                                             fontWeight: FontWeight.bold),
//                                                                       ),
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ));
