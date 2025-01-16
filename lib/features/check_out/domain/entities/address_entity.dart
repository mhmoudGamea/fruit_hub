class AddressEntity {
  final String name;
  final String email;
  final String address;
  final String city;
  final String flatFloorNumber;
  bool saveAddress;

  AddressEntity({
    required this.name,
    required this.email,
    required this.address,
    required this.city,
    required this.flatFloorNumber,
    this.saveAddress = false,
  });
}
