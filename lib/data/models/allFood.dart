class AllFoods {
  final String images;
  final String foodTitle;
  final String productDesc;
  final double price;
  final double ratings;
  int qty;

  AllFoods({
    required this.images,
    required this.foodTitle,
    required this.productDesc,
    required this.price,
    required this.ratings,
    required this.qty,
  });
}

List<AllFoods> allFodData = [
  AllFoods(
      images: "assets/allfood/chickern_rolls.png",
      foodTitle: "Chicken Roll",
      productDesc: "productDesc",
      price: 159.0,
      ratings: 3.5,
      qty: 0),
  AllFoods(
      images: "assets/allfood/chiken_burder.png",
      foodTitle: "Chiken Burder",
      productDesc: "productDesc",
      price: 149.0,
      ratings: 4.0,
      qty: 0),
  AllFoods(
      images: "assets/allfood/coleslaw.png",
      foodTitle: "Coleslaw",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/dumplings.png",
      foodTitle: "Dumplings",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/french_fries.png",
      foodTitle: "French Fries",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/hot_shusi.png",
      foodTitle: "Hot Shusi",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/mix_veg_pizza.png",
      foodTitle: "Mix Veg Pizza",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/sandwich.png",
      foodTitle: "Sandwich",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/veg_burger.png",
      foodTitle: "Veg Burger",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
  AllFoods(
      images: "assets/allfood/veggie_pizza.png",
      foodTitle: "Veggie Pizza",
      productDesc: "productDesc",
      price: 159,
      ratings: 4.3,
      qty: 0),
];
