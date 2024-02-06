import 'package:flutter/material.dart';

class PaymentModes {
  final String image;
  final String title;

  PaymentModes({required this.image, required this.title});
}

List<PaymentModes> payModes = [
  PaymentModes(image: 'assets/png/phonepe.png', title: "PhonePe UPI"),
  PaymentModes(image: 'assets/png/googlepay.png', title: "GooglePay"),
  PaymentModes(image: 'assets/png/paytm.png', title: "Paytm"),
];
