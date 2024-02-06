import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/words.dart';
import 'package:foodies_app/data/models/orderItemDataModal.dart';
import 'package:foodies_app/utils/orderHistoryItemCard.dart';
import 'package:get/get.dart';

class OrderHistoryCard extends StatefulWidget {
  final int? orderId;
  final String status;
  final int totalQty;
  final String dateTime;
  final double totalPrice;
  final String orderAddress;
  final double rating;

  const OrderHistoryCard(
      {super.key,
      this.orderId,
      required this.status,
      required this.totalQty,
      required this.dateTime,
      required this.totalPrice,
      required this.orderAddress,
      required this.rating});

  @override
  State<OrderHistoryCard> createState() => _OrderHistoryCardState();
}

class _OrderHistoryCardState extends State<OrderHistoryCard> {
  @override
  Widget build(BuildContext context) {
    String Status = widget.status;
    print("Status : $Status");

    List filteredOrderItemData =
        orderItemData.where((item) => item.orderId == widget.orderId).toList();

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
      width: w.h,
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
      child: Column(
        children: [
          if (filteredOrderItemData.isNotEmpty)
            Wrap(
              children: filteredOrderItemData.map((item) {
                return OrderHistoryItemCard(
                    image: item.image,
                    title: item.title,
                    subCategory: item.subCategory,
                    portionSize: item.portionSize,
                    qty: item.qty,
                    unitPrice: item.unitPrice);
              }).toList(),
            )
          else
            Container(),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding: EdgeInsets.all(8.0.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.r),
                    child: Text(
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.left,
                      "Total Qty. : ${widget.totalQty}",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Inder',
                          fontWeight: FontWeight.bold),
                    )),
                const Spacer(),
                Container(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Status == 'Process'
                                ? Colors.green
                                : (Status == 'Shipped'
                                    ? Colors.yellow.shade800
                                    : Colors.grey),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.r, vertical: 5.r),
                          child: Text(
                            widget.status,
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Status == 'Process'
                                  ? Colors.white
                                  : (Status == 'Shipped'
                                      ? Colors.black
                                      : Colors.black),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(width: 10.w)
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                child: Text(
                  widget.dateTime,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: h * 0.015.sp,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              const Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                child: Text(
                  "Grand Total :",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: h * 0.015.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.r),
                child: Text(
                  "${Words.INRSymbol} ${widget.totalPrice}",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: h * 0.015.sp,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.r, bottom: 5.r),
                child: Text(
                  "Rate",
                  style: TextStyle(
                      color: FoodiesColors.accentColor,
                      fontFamily: "Inder",
                      fontSize: h * .018.sp),
                ),
              ),
              SizedBox(
                width: 20.h,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 5.r),
                child: RatingBar.builder(
                  initialRating: widget.rating,
                  allowHalfRating: true,
                  itemSize: 20,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  onRatingUpdate: (value) {
                    print(value);
                  },
                ),
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    print("Cancel not allowed");
                  },
                  child: Status == 'Process'
                      ? Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.only(
                            bottom: 5.r,
                          ),
                          child: Text(
                            "Cancel Order",
                            style: TextStyle(
                                fontFamily: "Inder",
                                fontSize: 14.h,
                                color: FoodiesColors.accentColor),
                          ),
                        )
                      : (Status == 'Shipped' ? Container() : Container()))
            ],
          )
        ],
      ),
    );
  }
}
