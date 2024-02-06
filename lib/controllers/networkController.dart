import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:foodies_app/constants/appMessages.dart';
import 'package:foodies_app/constants/fontSizes.dart';
import 'package:foodies_app/widgtes/notNetwork.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((event) {
      _updateConnectionStatus(event);
    });
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
          backgroundColor: Get.isDarkMode ? Colors.red.shade100 : Colors.black,
          messageText: const Text(
            AppMessages.networkError,
            style: TextStyle(
              fontSize: FontSize.mediumBodyText,
              // color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
          isDismissible: false,
          duration: const Duration(days: 1),
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.red,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.FLOATING);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
