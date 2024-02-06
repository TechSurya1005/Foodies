import 'package:flutter/material.dart';
import 'package:foodies_app/constants/fontSizes.dart';

class UnknownScreen extends StatefulWidget {
  const UnknownScreen({super.key});

  @override
  State<UnknownScreen> createState() => _UnknownPageState();
}

class _UnknownPageState extends State<UnknownScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Please check your routes.",
          style: TextStyle(fontSize: FontSize.largeFontSize),
        ),
      ),
    );
  }
}
