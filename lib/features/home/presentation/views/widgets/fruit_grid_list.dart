import 'package:flutter/material.dart';

import '../../../../../core/widgets/fruit_item.dart';

class FruitGridList extends StatelessWidget {
  const FruitGridList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 244,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
      itemCount: 12,
    );
  }
}
