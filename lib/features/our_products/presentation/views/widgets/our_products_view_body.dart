import 'package:flutter/material.dart';
import 'package:fruit_hub/core/widgets/custom_head_line.dart';
import 'package:fruit_hub/features/our_products/presentation/views/widgets/our_product_list_view.dart';

import '../../../../../core/utilies/constants.dart';
import '../../../../home/presentation/views/widgets/products_grid_list_bloc_builder.dart';
import '../../../../home/presentation/views/widgets/custom_search.dart';
import 'widget_notification_app_bar.dart';
import 'our_products_head_line.dart';

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
                WidgetNotificationAppBar(),
                Column(
                  children: [
                    SizedBox(height: 16),
                    CustomSearch(),
                    SizedBox(height: 16),
                    OurProductsFilterHeadLine(),
                    SizedBox(height: 8),
                    OurProductListView(),
                    SizedBox(height: 24),
                    CustomHeadLine(),
                    SizedBox(height: 8),
                  ],
                )
              ],
            ),
          ),
          ProductsGridListBlocBuilder(),
        ],
      ),
    );
  }
}
