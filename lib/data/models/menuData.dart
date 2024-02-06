import 'package:flutter/material.dart';
import 'package:foodies_app/constants/assets.dart';
import 'package:foodies_app/data/models/menuModal.dart';

class MenuData {
  final int menuID;
  final String type;
  final String image;
  final String title;
  final String desc;
  final String itemType;
  final double rating;
  final IconData? iconData;
  final IconData? shareIcon;
  final double Price;
  final String time;
  final int distance;
  final String food_Variety;

  MenuData({
    required this.type,
    required this.image,
    required this.title,
    required this.desc,
    required this.itemType,
    required this.rating,
    this.iconData,
    this.shareIcon,
    required this.Price,
    required this.menuID,
    required this.time,
    required this.distance,
    required this.food_Variety,
  });
}

// List<String> menuType = ["Tasty Sushi", "French Fries", "Hot Barbecue"];
List<MenuData> menuData = [
  MenuData(
      type: menuList[0].menuTitle,
      image: AppAssets.sushi2,
      title: "Nigirizushi",
      desc:
          "A hand-pressed bed of rice topped with a single piece of seafood. ",
      itemType: "Veg",
      rating: 4.3,
      Price: 199.0,
      menuID: menuList[0].menuId,
      time: '30-35',
      distance: 3,
      food_Variety: 'fish'),
  MenuData(
      type: menuList[0].menuTitle,
      image: AppAssets.sushi3,
      title: "Chirashizushi",
      desc: "A colorful mix of ingredients scattered over sushi rice.",
      itemType: "Non-Veg",
      rating: 3.4,
      Price: 255.0,
      menuID: menuList[0].menuId,
      time: '30-35',
      distance: 3,
      food_Variety: 'fish'),
  MenuData(
      type: menuList[0].menuTitle,
      image: AppAssets.sushi4,
      title: "California roll",
      desc: "A popular roll containing crabmeat, avocado, and cucumber.",
      itemType: "Veg",
      rating: 4.4,
      Price: 219.0,
      menuID: menuList[0].menuId,
      time: '30-35',
      distance: 3,
      food_Variety: 'fish'),
  MenuData(
      type: menuList[0].menuTitle,
      image: AppAssets.sushi5,
      title: "Sashimi",
      desc: "Fresh, raw fish or meat cut into thin slices.",
      itemType: "Non-Veg",
      rating: 4.2,
      Price: 299.0,
      menuID: menuList[0].menuId,
      time: '30-35',
      distance: 3,
      food_Variety: 'fish'),
  MenuData(
      type: menuList[0].menuTitle,
      image: AppAssets.sushi6,
      title: "Temakizushi",
      desc:
          "Rice and ingredients held within a sheet of nori wrapped into a conical shape.",
      itemType: "Veg",
      rating: 4.2,
      Price: 199.0,
      menuID: menuList[0].menuId,
      time: '30-35',
      distance: 3,
      food_Variety: 'fish'),
];
