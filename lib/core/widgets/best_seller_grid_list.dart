import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/presentation/model_views/home_cubit/products_cubit.dart';
import 'fruit_item.dart';

class BestSellerGridList extends StatelessWidget {
  const BestSellerGridList({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<ProductsCubit>(context);
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 240,
        crossAxisSpacing: 16,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: homeCubit.products[index],
        );
      },
      itemCount: homeCubit.products.length,
    );
  }
}
