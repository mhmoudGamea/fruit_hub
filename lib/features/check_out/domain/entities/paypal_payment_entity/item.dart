class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({this.name, this.quantity, this.price, this.currency});

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        name: data['name'] as String?,
        quantity: data['quantity'] as int?,
        price: data['price'] as String?,
        currency: data['currency'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
}
