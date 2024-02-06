import 'package:foodies_app/constants/assets.dart';

class OrderItemDataModal {
  final int productId;
  final int orderId;
  final String image;
  final String title;
  final String subCategory;
  final String portionSize;
  final double qty;
  final double unitPrice;

  OrderItemDataModal(
      {required this.productId,
      required this.orderId,
      required this.image,
      required this.title,
      required this.subCategory,
      required this.portionSize,
      required this.qty,
      required this.unitPrice});
}

List<OrderItemDataModal> orderItemData = [
  OrderItemDataModal(
      productId: 1,
      image: AppAssets.Jalapeno_pizza_1,
      title: 'Jalapeno_pizza',
      subCategory: 'Veg',
      portionSize: 'Regular',
      qty: 1,
      unitPrice: 149,
      orderId: 1),
  OrderItemDataModal(
      productId: 2,
      image: AppAssets.coleslaw,
      title: 'Coleslaw',
      subCategory: 'Non-Veg',
      portionSize: 'Half',
      qty: 1,
      unitPrice: 149,
      orderId: 2),
  OrderItemDataModal(
      productId: 2,
      image: 'assets/png/burger2_img.png',
      title: 'Burger',
      subCategory: 'Veg',
      portionSize: 'Medium',
      qty: 1,
      unitPrice: 149,
      orderId: 2),
];
