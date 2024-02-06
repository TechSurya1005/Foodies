import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodies_app/app/routes/routes.dart';
import 'package:foodies_app/app/theme/themes.dart';
import 'package:foodies_app/controllers/checkNetworkController.dart';
import 'package:foodies_app/controllers/themeControllers.dart';
import 'package:foodies_app/pages/aboutus.dart';
import 'package:foodies_app/pages/addressbook..dart';
import 'package:foodies_app/pages/checkOutPage.dart';
import 'package:foodies_app/pages/feedback.dart';
import 'package:foodies_app/pages/foodDetails.dart';
import 'package:foodies_app/pages/menuPage.dart';
import 'package:foodies_app/pages/onboardScreen.dart';
import 'package:foodies_app/pages/profileEdit.dart';
import 'package:foodies_app/pages/search_location.dart';
import 'package:foodies_app/pages/splashScreeen.dart';
import 'package:foodies_app/pages/support.dart';
import 'package:foodies_app/pages/themeButton.dart';
import 'package:foodies_app/pages/unknownScreen.dart';
import 'package:foodies_app/screens/auth/changePassword.dart';
import 'package:foodies_app/screens/auth/forgot.dart';
import 'package:foodies_app/screens/auth/forgotOtp.dart';
import 'package:foodies_app/screens/auth/login_with_number.dart';
import 'package:foodies_app/screens/auth/otpVerification.dart';
import 'package:foodies_app/screens/auth/signUp.dart';
import 'package:foodies_app/screens/mainHome/cart/cartScreen.dart';
import 'package:foodies_app/screens/mainHome/home/Home.dart';
import 'package:foodies_app/screens/mainHome/mainHome.dart';
import 'package:foodies_app/screens/mainHome/newsBlog/newsandblog.dart';
import 'package:foodies_app/screens/mainHome/orderDetails/orderDetails.dart';
import 'package:foodies_app/screens/mainHome/profile/profile.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
  Get.put(ThemeControllers());
  DependencyInjection.init();
}

final box = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeControllers themeController = Get.put(ThemeControllers());
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(375, 815),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          theme: lightTheme,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: themeController.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.splash,
          defaultTransition: Transition.rightToLeft,
          getPages: [
            GetPage(
              name: AppRoutes.splash,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: AppRoutes.onBoarding,
              page: () => const OnBoardScreen(),
            ),
            GetPage(
              name: AppRoutes.loginNumber,
              page: () => const LoginWithNumber(),
            ),
            GetPage(name: AppRoutes.home, page: () => const Home()),
            GetPage(
                name: AppRoutes.orderDetails, page: () => const OrderDetails()),
            GetPage(
              name: AppRoutes.checkOutDetails,
              page: () => const CheckOutPage(),
            ),
            GetPage(
              name: AppRoutes.newsandblog,
              page: () => const NewsAndBlog(),
            ),
            GetPage(
              name: AppRoutes.profile,
              page: () => const ProfileScreen(),
            ),
            GetPage(
              name: AppRoutes.profileEdit,
              page: () => const ProfileEdit(),
            ),
            GetPage(
              name: AppRoutes.addressbook,
              page: () => const AddressBook(),
            ),
            GetPage(
              name: AppRoutes.feedback,
              page: () => const FeedbackScreen(),
            ),
            GetPage(
              name: AppRoutes.about,
              page: () => const AboutUs(),
            ),
            GetPage(
              name: AppRoutes.supportUs,
              page: () => const SupportPage(),
            ),
            GetPage(
              name: AppRoutes.menuPage,
              page: () => const MenuPage(),
            ),
            GetPage(
                name: AppRoutes.otpVerification,
                page: () => const OTPVerification()),
            GetPage(
                name: AppRoutes.forgotPass, page: () => const ForgotPassword()),
            GetPage(
              name: AppRoutes.forgotOtp,
              page: () => const ForgotOtp(),
            ),
            GetPage(
              name: AppRoutes.changePass,
              page: () => const ChangePassword(),
            ),
            GetPage(
              name: AppRoutes.signUp,
              page: () => const SignUp(),
            ),
            GetPage(
              name: AppRoutes.homeMain,
              page: () => const MainHome(),
            ),
            GetPage(
              name: AppRoutes.cartScreen,
              page: () => const CartScreen(),
            ),
            GetPage(
              name: AppRoutes.foodDetails,
              page: () => const FoodDetails(),
            ),
            GetPage(
              name: AppRoutes.themeChange,
              page: () => const ThemeChangeButton(),
            ),
            GetPage(
              name: AppRoutes.searchLocation,
              page: () => const SearchLoacation(),
            ),
          ],
          unknownRoute: GetPage(
            name: "/unknown",
            page: () => const UnknownScreen(),
          ),
        );
      },
    );
  }
}
