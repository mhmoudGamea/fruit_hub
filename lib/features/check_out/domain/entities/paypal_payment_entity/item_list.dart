import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import 'item.dart';

class ItemList {
  List<Item>? items;

  ItemList({this.items});

  factory ItemList.fromOrderEntity(OrderEntity order) {
    return ItemList(
        items: order.cartEntity.map(
      (e) {
        return Item(
          quantity: e.count,
          currency: 'USD',
          name: e.productEntity.productName,
          price: (double.parse(e.productEntity.productPrice)).toString(),
        );
      },
    ).toList());
  }

  factory ItemList.fromMap(Map<String, dynamic> data) => ItemList(
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'items': items?.map((e) => e.toMap()).toList(),
      };
}
