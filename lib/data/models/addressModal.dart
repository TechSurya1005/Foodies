class AddressModal {
  final int addressId;
  final String addressOf;
  final String addressStatus;
  final String addressType;
  final String actualAddress;
  final String areaAddress;
  final String landmark;
  final double addressDistance;

  AddressModal(
      {required this.addressId,
      required this.addressOf,
      required this.addressStatus,
      required this.addressType,
      required this.actualAddress,
      required this.areaAddress,
      required this.landmark,
      required this.addressDistance});
}

List<AddressModal> addressData = [
  AddressModal(
      addressId: 1,
      addressOf: "Self",
      addressStatus: "DELIVER TO",
      addressType: "Work",
      actualAddress: "Programmics Technology 08 2nd floor Govind Kunj",
      areaAddress: "Civil Lines",
      landmark: "Arena Animations",
      addressDistance: 3.3),
  AddressModal(
      addressId: 2,
      addressOf: "Self",
      addressStatus: "DELIVER TO",
      addressType: "Home",
      actualAddress: "Front Kadari Manjil,",
      areaAddress: "Debhar city",
      landmark: "Ravathpura Phase 2",
      addressDistance: 2.5)
];
