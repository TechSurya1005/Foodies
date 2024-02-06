import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/controllers/location_place_search_controller.dart';
import 'package:foodies_app/services/apis/Apis.dart';
import 'package:foodies_app/widgtes/palceLocationTile.dart';
import 'package:get/get.dart';

class SearchLoacation extends StatefulWidget {
  const SearchLoacation({super.key});

  @override
  State<SearchLoacation> createState() => _SearchLoacationState();
}

class _SearchLoacationState extends State<SearchLoacation> {

  LocationPlaceSearchController _locationPlaceSearchController = Get.put(LocationPlaceSearchController());

  void placeAutoComplete(String query) async {
    Uri uri = Uri.https("maps.googleapis.com",
    "maps/api/place/autocomplete/json", //unencoder
      {
        "input" : query,
        "key" : APIs.placeApi
      }
    );
    String? response = await _locationPlaceSearchController.fetchUrl(uri);

    if(response!=null){
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
         body: CustomScrollView(
           slivers: [
             SliverAppBar(
               leading: IconButton(
                 onPressed: () {
                   Get.back();
                 },
                 icon: const Icon(Icons.arrow_back),
                 color: Colors.black,
               ),
               backgroundColor: FoodiesColors.cardBackground,
               automaticallyImplyLeading: false,
               pinned: true,
               elevation: 0,
               centerTitle: true,
               title: Text(
                 "Set Delivery Location",
                 style: TextStyle(
                     color: FoodiesColors.textColor,
                     fontSize: h * 0.025.sp,
                     fontFamily: 'Inter',
                     fontWeight: FontWeight.bold),
               ),
             ),
             SliverToBoxAdapter(
               child: Column(children: [
                 Container(
                     alignment: Alignment.center,
                     margin: EdgeInsets.symmetric(horizontal: 10.w),
                     padding: EdgeInsets.symmetric(horizontal: 15.w),
                     decoration: BoxDecoration(
                       color: FoodiesColors.card,
                       borderRadius: BorderRadius.circular(10.r),
                     ),
                     child: TextFormField(
                       style: const TextStyle(
                           fontSize: FontSize.mediumBodyText),
                       decoration: InputDecoration(
                           hintText: "Search locations",
                           border: InputBorder.none,
                           focusColor: FoodiesColors.textColor,
                           prefixIcon: const Icon(
                             CupertinoIcons.search,
                             color: FoodiesColors.accentColor,
                           ),
                           suffixIcon: IconButton(
                               onPressed: () {
                                 print("Mic Clicked");
                               },
                               icon: const Icon(
                                 CupertinoIcons.mic,
                                 color: FoodiesColors.accentColor,
                               ))),
                     )),
                 SizedBox(
                   height: 10.h,
                 ),
                 InkWell(
                   onTap: () {
                     placeAutoComplete("Dubai");
                   },
                   child: Container(
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
                             CupertinoIcons.location,
                             color: FoodiesColors.accentColor,
                             size: 25,
                           ),
                           SizedBox(
                             width: 20.w,
                           ),
                           Text(
                             "Use current locations",
                             style: TextStyle(
                               color: FoodiesColors.accentColor,
                               fontSize: 16.sp,
                               fontWeight: FontWeight.bold,
                               fontFamily: 'Inter',
                             ),
                           ),
                           const Spacer(),
                           Icon(
                             CupertinoIcons.forward,
                             color:
                             FoodiesColors.textColor.withOpacity(0.5),
                           )
                         ],
                       )),
                 ),
                 SizedBox(
                   height: 10.h,
                 ),
                 Container(
                     margin: EdgeInsets.symmetric(horizontal: 10.w),
                     height: h * 0.9.h,
                     child: ListView.builder(
                       itemCount: 1,
                       itemBuilder: (context, index) {
                         return const PlaceLocationTile(title: "Rapiur",
                             desc: "Civil lines govind kunj",
                             dis: 9.3);
                       },
                     ))
               ],),
             )
           ],
         ),
    );
  }
}
