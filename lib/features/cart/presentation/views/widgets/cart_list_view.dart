import 'package:flutter/material.dart';

import '../../../domain/entity/cart_entity.dart';
import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartEntities});

  final List<CartEntity>
      cartEntities; // [cartEntitie, cartEntitie, cartEntitie] // length = 3

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => CartListViewItem(
        isLast: index == cartEntities.length - 1,
        cartEntity: cartEntities[index],
      ),
      itemCount: cartEntities.length,
    );
  }
}
