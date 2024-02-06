import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/data/models/addressModal.dart';
import 'package:foodies_app/utils/addresscard.dart';
import 'package:get/get.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({super.key});

  @override
  State<AddressBook> createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: FoodiesColors.cardBackground,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Address Book",
          style: AppTextStyles.homeTitleStyle,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 10.r),
            padding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
            decoration: BoxDecoration(
                color: FoodiesColors.cardColor,
                borderRadius: BorderRadius.circular(5.r),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.2,
                      spreadRadius: 0.2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(0, 0.5))
                ]),
            child: const Row(
              children: [
                Icon(
                  Icons.add,
                  color: FoodiesColors.accentColor,
                  size: 27,
                ),
                Text("Add Address")
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10.r),
              height: h,
              child: ListView.builder(
                  itemCount: addressData.length,
                  itemBuilder: (context, index) {
                    return AddressCard(
                        addressId: addressData[index].addressId,
                        addressStatus: addressData[index].addressStatus,
                        addressType: addressData[index].addressType,
                        actualAddress: addressData[index].actualAddress,
                        areaAddress: addressData[index].areaAddress,
                        landmark: addressData[index].landmark,
                        addressDistance: addressData[index].addressDistance);
                  }))
        ],
      ),
    );
  }
}
