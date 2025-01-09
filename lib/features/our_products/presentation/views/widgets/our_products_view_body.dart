import 'package:flutter/material.dart';

import '../../../../../core/utilies/constants.dart';
import '../../../../home/presentation/views/widgets/best_seller_grid_list_bloc_builder.dart';
import '../../../../home/presentation/views/widgets/custom_home_app_bar.dart';
import '../../../../home/presentation/views/widgets/custom_search.dart';
import '../../../../home/presentation/views/widgets/head_line_home_item.dart';

class OurProductsViewBody extends StatelessWidget {
  const OurProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                Column(
                  children: [
                    SizedBox(height: 16),
                    CustomSearch(),
                    SizedBox(height: 12),
                    HeadLineHomeItem(),
                    SizedBox(height: 8),
                  ],
                )
              ],
            ),
          ),
          BestSellerGridListBlocBuilder(),
        ],
      ),
    );
  }
}
