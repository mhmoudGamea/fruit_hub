class AddressModel {
  final String name;
  final String email;
  final String number;
  final String address;
  final String city;
  final String floor;
  bool saveAddress;

  AddressModel({
    required this.name,
    required this.email,
    required this.number,
    required this.address,
    required this.city,
    required this.floor,
    this.saveAddress = false,
  });

  static Map<String, dynamic> toJson(AddressModel address) {
    return {
      'name': address.name,
      'email': address.email,
      'number': address.number,
      'address': address.address,
      'city': address.city,
      'floor': address.floor,
      'saveAddress': address.saveAddress,
    };
  }
}
