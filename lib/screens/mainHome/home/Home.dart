import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/constants/appFonts.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/controllers/offerListController.dart';
import 'package:foodies_app/controllers/orderQntyBtn.dart';
import 'package:foodies_app/controllers/productAddButton.dart';
import 'package:foodies_app/controllers/timePickerController.dart';
import 'package:foodies_app/skeleton/homeSkaleton.dart';
import 'package:foodies_app/widgtes/categoryList.dart';
import 'package:foodies_app/widgtes/categoryList2.dart';
import 'package:foodies_app/widgtes/menuCardLists.dart';
import 'package:foodies_app/widgtes/palceLocationTile.dart';
import 'package:foodies_app/widgtes/poductsList.dart';
import 'package:foodies_app/widgtes/popularItemList.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/datePickerController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imageList = [
    {"id": 1, "image_path": AppAssets.banner1},
    {"id": 2, "image_path": AppAssets.banner2},
    {"id": 3, "image_path": AppAssets.banner3},
  ];

  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;

  bool isLoading = true;

  Future getData() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }

  final OrderQtyBtn _orderQtyBtn = Get.put(OrderQtyBtn());
  // final token = box.read('access'); _

  final AddProductButton _addProductButton = Get.put(AddProductButton());
  final OfferController _offerController = Get.put(OfferController());

  @override
  void initState() {
    // _offerController.fetchOfferData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting &&
                  isLoading) {
                return Shimmer.fromColors(
                  baseColor: FoodiesColors.cardColor,
                  highlightColor: Colors.white,
                  child: const HomeSkeleton(),
                );
              } else if (snapshot.hasError) {
                return ErrorWidget(snapshot.hasError);
              } else {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: false,
                      floating: true,
                      expandedHeight: 70.h,
                      flexibleSpace: Container(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        color: FoodiesColors.backgroundColor,
                        width: w.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 30,
                              color: FoodiesColors.accentColor,
                            ),
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: () {
                                Get.toNamed(AppRoutes.searchLocation);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Work',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: FoodiesColors.textColor,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Image(
                                        image: const AssetImage(
                                            AppAssets.down_arrow),
                                        height: 10.h,
                                        width: 10.w,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      'Civil Lines Raipur,12345678',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: FoodiesColors.textColor,
                                        fontFamily: 'Inder',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return bookYourTable();
                                  },
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15.r,
                                child: ClipOval(
                                  child: Image(
                                    image: const AssetImage(
                                      AppAssets.table_book_icon,
                                    ),
                                    fit: BoxFit.cover,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(10),
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(AppRoutes.profile),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 15.r,
                                child: ClipOval(
                                  child: Image(
                                    image: const AssetImage(
                                      AppAssets.profile_sample,
                                    ),
                                    fit: BoxFit.cover,
                                    height: 30.h,
                                    width: 30.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: MyPersistentHeaderDelegate(),
                      pinned: true,
                    ),
                    // SliverToBoxAdapter(
                    //     child: Obx(
                    //   () => Container(
                    //       height: 70.h,
                    //       alignment: Alignment.centerLeft,
                    //       child: ListView.builder(
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: _offerController.allOfferData.length,
                    //         itemBuilder: (BuildContext context, int index) {
                    //           var offerItemData =
                    //               _offerController.allOfferData[index];
                    //           // print(offerItemData);
                    //           return Padding(
                    //             padding: const EdgeInsets.all(10.0),
                    //             child: Container(
                    //               padding: const EdgeInsets.all(10),
                    //               decoration: BoxDecoration(
                    //                 color: FoodiesColors.cardColor,
                    //                 borderRadius: BorderRadius.circular(15),
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                     blurRadius: 0.2,
                    //                     spreadRadius: 0.2,
                    //                     color: Colors.black.withOpacity(0.3),
                    //                     offset: const Offset(0, 0.5),
                    //                   ),
                    //                 ],
                    //               ),
                    //               child: Row(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: [
                    //                   SizedBox(
                    //                     height: 60.h,
                    //                     width: 60.w,
                    //                     // child: Image.network(
                    //                     //   offerItemData['image'].toString(),
                    //                     //   errorBuilder: (
                    //                     //     context,
                    //                     //     error,
                    //                     //     stackTrace,
                    //                     //   ) {
                    //                     //     return const CircleAvatar(
                    //                     //       backgroundColor:
                    //                     //           FoodiesColors.accentColor,
                    //                     //       child: Icon(
                    //                     //         Icons.close,
                    //                     //         color: Colors.white,
                    //                     //       ),
                    //                     //     );
                    //                     // },
                    //
                    //                     // ),
                    //                     child: const CircleAvatar(
                    //                       backgroundColor:
                    //                           FoodiesColors.accentColor,
                    //                       child: Icon(
                    //                         Icons.close,
                    //                         color: Colors.white,
                    //                       ),
                    //                     ),
                    //                   ),
                    //                   SizedBox(width: 10.w),
                    //                   Text(
                    //                     offerItemData['title'],
                    //                     style: TextStyle(
                    //                       fontFamily: 'Inder',
                    //                       fontSize: 14.sp,
                    //                       fontWeight: FontWeight.w600,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           );
                    //         },
                    //       )),
                    // )),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2.r),
                              blurRadius: 5.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: InkWell(
                            onTap: () => print("$currentIndex"),
                            child: CarouselSlider(
                              items: imageList
                                  .map((item) => Image.asset(
                                        item['image_path'],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ))
                                  .toList(),
                              carouselController: _carouselController,
                              options: CarouselOptions(
                                scrollPhysics: const BouncingScrollPhysics(),
                                autoPlay: true,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.only(left: 15, top: 10),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Our Popular Food Items",
                          style: AppTextStyles.homeTitleStyle,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: PopularItemList(),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, bottom: 10.h),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Foodies Menus",
                          style: AppTextStyles.homeTitleStyle,
                        ),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: MenuCardList(),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    // SliverToBoxAdapter(
                    //   child: Container(
                    //     margin: const EdgeInsets.symmetric(horizontal: 20),
                    //     child: Row(
                    //       children: <Widget>[
                    //         const Expanded(
                    //           child: Divider(
                    //             thickness: 1,
                    //             color: FoodiesColors.accentColor,
                    //           ),
                    //         ),
                    //         SizedBox(width: 5.w),
                    //         // const Text(
                    //         //   "Your Choices",
                    //         //   style: AppTextStyles.paragraphStyle,
                    //         // ),
                    //         // SizedBox(width: 5.w),
                    //         // const Expanded(
                    //         //   child: Divider(
                    //         //     thickness: 1,
                    //         //     color: FoodiesColors.accentColor,
                    //         //   ),
                    //         // ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // SliverToBoxAdapter(
                    //   child: SizedBox(
                    //     height: 10.h,
                    //   ),
                    // ),
                    // const SliverToBoxAdapter(
                    //   child: CategoryList(),
                    // ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                color: FoodiesColors.accentColor,
                              ),
                            ),
                            SizedBox(width: 5.w),
                            const Text(
                              "All Foodies Items",
                              style: AppTextStyles.paragraphStyle,
                            ),
                            SizedBox(width: 5.w),
                            const Expanded(
                              child: Divider(
                                thickness: 1,
                                color: FoodiesColors.accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: CategoryList2(),
                    ),
                    const ProductList(),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
      bottomNavigationBar: _orderQtyBtn.totalQty > 0
          ? InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.cartScreen);
                print(_addProductButton.tempProductData);
                print(_orderQtyBtn.quantities);
              },
              child: Container(
                height: 60.h,
                color: FoodiesColors.accentColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        _orderQtyBtn.totalQty.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter"),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Inter"),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: 18.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget bookYourTable() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    const List<String> list = <String>[
      '2 People',
      '4 People',
      '6 People',
      '8 People'
    ];

    final DatePickerController datePickercontroller =
        Get.put(DatePickerController());
    final TimePickerController timePickerController =
        Get.put(TimePickerController());

    String _formatTime(TimeOfDay time) {
      final now = DateTime.now();
      final dateTime =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);
      final formattedTime =
          DateFormat.jm().format(dateTime); // Format with AM/PM
      return formattedTime;
    }

    return Container(
        color: Colors.transparent,
        // height: h * 0.6,
        width: w.w,
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
                          margin: EdgeInsets.only(
                              top: 20.h, left: 20.w, bottom: 10.h),
                          child: const Center(
                            child: Text(
                              "Book Your Table",
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
                            width: w.w,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10.r),
                            margin: EdgeInsets.symmetric(horizontal: 10.r),
                            decoration: BoxDecoration(
                                color: FoodiesColors.cardColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.person_2,
                                  color: FoodiesColors.accentColor,
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                DropdownMenu<String>(
                                  trailingIcon: const SizedBox.shrink(),
                                  initialSelection: list.first,
                                  textStyle: TextStyle(
                                      color: FoodiesColors.textColor
                                          .withOpacity(0.7)),
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                          border: InputBorder.none),
                                  onSelected: (String? value) {},
                                  dropdownMenuEntries: list
                                      .map<DropdownMenuEntry<String>>(
                                          (String value) {
                                    return DropdownMenuEntry<String>(
                                        value: value, label: value);
                                  }).toList(),
                                ),
                                const Spacer(),
                                Image(
                                  image: const AssetImage(AppAssets.down_arrow),
                                  height: 10.h,
                                  width: 10.w,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                              ],
                            )),
                        InkWell(
                          onTap: () => datePickercontroller.showDatePicker(),
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 15.h),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                  color: FoodiesColors.cardColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.calendar,
                                    color: FoodiesColors.accentColor,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Obx(
                                    () => Text(
                                      datePickercontroller.formattedDate.value,
                                      style: TextStyle(
                                          color: FoodiesColors.textColor
                                              .withOpacity(0.7),
                                          fontSize: h * 0.020.sp),
                                    ),
                                  ),
                                  const Spacer(),
                                  Image(
                                    image:
                                        const AssetImage(AppAssets.down_arrow),
                                    height: 10.h,
                                    width: 10.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                ],
                              )),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            padding: EdgeInsets.only(left: 10.w),
                            decoration: BoxDecoration(
                                color: FoodiesColors.cardColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.time,
                                  color: FoodiesColors.accentColor,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Obx(
                                  () => Text(
                                    _formatTime(timePickerController
                                        .selectedTime.value),
                                    style: TextStyle(
                                        color: FoodiesColors.textColor
                                            .withOpacity(0.7),
                                        fontSize: h * 0.020.sp),
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () async {
                                      final pickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: timePickerController
                                            .selectedTime.value,
                                      );
                                      if (pickedTime != null) {
                                        timePickerController
                                            .setTime(pickedTime);
                                        print(pickedTime.format(context));
                                      }
                                    },
                                    icon: Image(
                                      image: const AssetImage(
                                          AppAssets.down_arrow),
                                      height: 10.h,
                                      width: 10.w,
                                    ))
                              ],
                            )),
                        InkWell(
                          onTap: ()=>Get.back(),
                          child: Container(
                              alignment: Alignment.center,
                              width: w.w,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              padding: EdgeInsets.only(
                                  left: 10.w, top: 10.h, bottom: 10.h),
                              decoration: BoxDecoration(
                                  color: FoodiesColors.accentColor,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Text(
                                "Book",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: h * 0.022.sp,
                                    color: Colors.white),
                              )),
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

  Widget getLocations() {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.transparent,
        width: w.w,
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
                        SizedBox(
                          height: 10.r,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Locations",
                            style: TextStyle(
                              fontSize: FontSize.mediumBodyText.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
                        Divider(
                          indent: 10.r,
                          endIndent: 10.r,
                          color: FoodiesColors.accentColor,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10.r,
                        ),
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
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            height: h * 0.35.h,
                            child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(
                                    Icons.location_on,
                                    size: 25,
                                    color: FoodiesColors.accentColor,
                                  ),
                                  title: Column(
                                    children: [
                                      Text(
                                        "Raipur Junction Sub Post Raipur",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        "Station Road, Railway Colony, Bilaspur, Chhattisgarh",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppFonts.Inder),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                    "9.3 Km",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: AppFonts.Inter,
                                    ),
                                  ),
                                );
                              },
                            ))
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

class MyPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70.0.h;
  @override
  double get maxExtent => 70.0.h;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        padding: const EdgeInsets.all(10),
        color: FoodiesColors.cardBackground,
        alignment: Alignment.center,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
              color: FoodiesColors.card,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              style: const TextStyle(fontSize: FontSize.mediumBodyText),
              decoration: InputDecoration(
                  hintText: "Search here.....",
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
            )));
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
