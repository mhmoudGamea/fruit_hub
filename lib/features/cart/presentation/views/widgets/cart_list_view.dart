import 'package:flutter/material.dart';

import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => CartListViewItem(isLast: index == 9),
      itemCount: 10,
    );
  }
}
