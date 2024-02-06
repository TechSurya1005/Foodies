import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodies_app/constants/appTextStyles.dart';
import 'package:foodies_app/constants/colors.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/controllers/permmision_controllers.dart';
import 'package:foodies_app/screens/mainHome/cart/cartScreen.dart';
import 'package:foodies_app/screens/mainHome/home/Home.dart';
import 'package:foodies_app/screens/mainHome/newsBlog/newsandblog.dart';
import 'package:foodies_app/screens/mainHome/orderDetails/orderDetails.dart';
import 'package:get/get.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  var _currentIndex = 0;

  List<Widget> Pages = [
    const Home(),
    const OrderDetails(),
    const CartScreen(),
    const NewsAndBlog()
  ];

  PermissionController _permissionController = Get.put(PermissionController());

  @override
  void initState()  {
    _permissionController.checkCameraPermission();
    if(_permissionController.cameraPermissionGranted()==false){
      _permissionController.requestCameraPermission();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Pages[_currentIndex]),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
              elevation: 10,
              indicatorColor: FoodiesColors.cardColor,
              labelTextStyle: MaterialStateProperty.all(const TextStyle(
                  fontSize: FontSize.smallBodyText,
                  fontWeight: FontWeight.bold))),
          child: NavigationBar(
            backgroundColor: FoodiesColors.cardBackground,
            animationDuration: const Duration(seconds: 1),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 60,
            selectedIndex: _currentIndex,
            onDestinationSelected: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            destinations: [
              const NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.home,
                    color: FoodiesColors.accentColor,
                  ),
                  icon: Icon(CupertinoIcons.home),
                  label: "Home"),
              NavigationDestination(
                  selectedIcon: Image.asset(
                    'assets/png/shop.png',
                    color: FoodiesColors.accentColor,
                    height: 25,
                    width: 25,
                  ),
                  icon: Image.asset(
                    'assets/png/shop.png',
                    height: 25,
                    width: 25,
                  ),
                  label: "Order"),
              const NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.cart,
                    color: FoodiesColors.accentColor,
                  ),
                  icon: Icon(CupertinoIcons.cart),
                  label: "Cart"),
              const NavigationDestination(
                  selectedIcon: Icon(
                    CupertinoIcons.news,
                    color: FoodiesColors.accentColor,
                  ),
                  icon: Icon(CupertinoIcons.news),
                  label: "News and Blog")
            ],
          ),
        ),
      ),
    );
  }
}
