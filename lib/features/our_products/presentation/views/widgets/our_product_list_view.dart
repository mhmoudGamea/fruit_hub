import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/model_views/home_cubit/products_cubit.dart';
import 'our_product_list_view_item.dart';

class OurProductListView extends StatelessWidget {
  const OurProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<ProductsCubit>(context);
    return SizedBox(
      height: 87,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: homeCubit.products.length,
        itemBuilder: (context, index) => OurProductListViewItem(
          productEntity: homeCubit.products[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 9),
      ),
    );
  }
}
/*
OurProductItem(),
*/