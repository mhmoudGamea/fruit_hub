import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/widgets/custom_error_widget.dart';
import 'package:fruit_hub/features/home/presentation/model_views/home_cubit/products_cubit.dart';
import 'package:fruit_hub/features/home/presentation/model_views/home_cubit/products_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/best_seller_grid_list.dart';

class BestSellerGridListBlocBuilder extends StatelessWidget {
  const BestSellerGridListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return const BestSellerGridList();
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
              child: CustomErrorWidget(text: state.error));
        } else {
          /// HomeProductsLoading
          return const Skeletonizer.sliver(
            enabled: true,
            child: BestSellerGridList(),
          );
        }
      },
    );
  }
}
