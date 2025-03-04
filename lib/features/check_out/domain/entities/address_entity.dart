class AddressEntity {
  final String name;
  final String email;
  final String number;
  final String address;
  final String city;
  final String floor;
  bool saveAddress;

  AddressEntity({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
    required this.city,
    required this.floor,
    this.saveAddress = false,
  });

  @override
  String toString() {
    return '$city, $floor, $address';
  }
}
