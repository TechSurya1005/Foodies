class OrderHistoryModal {
  final int orderId;
  final String status;
  final int totalQty;
  final String dateTime;
  final double totalPrice;
  final String orderAddress;
  final double rating;

  OrderHistoryModal(
      {required this.orderId,
      required this.status,
      required this.totalQty,
      required this.dateTime,
      required this.totalPrice,
      required this.orderAddress,
      required this.rating});
}

List<OrderHistoryModal> orderHistoryData = [
  OrderHistoryModal(
      orderId: 1,
      status: "Process",
      totalQty: 1,
      dateTime: '11 Sept 2023, ',
      totalPrice: 250.0,
      orderAddress: "Civil Lines Raipur",
      rating: 3.5),
  OrderHistoryModal(
      orderId: 2,
      status: "Shipped",
      totalQty: 2,
      dateTime: '12 Sept 2023, 21:48PM',
      totalPrice: 378.0,
      orderAddress: "Guru Kripa Bhawan Ravathpura Phase 2,Raipur, 492001",
      rating: 4.0),
];
