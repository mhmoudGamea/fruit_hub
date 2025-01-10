import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_notification_app_bar.dart';
import '../../../../../core/widgets/products_grid_list.dart';

class BestSellerViewBody extends StatelessWidget {
  const BestSellerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomNotificationAppBar.customNotificationAppBar(context,
                    title: 'الأكثر مبيعا'),
                const SizedBox(height: 24),
                const Text('الأكثر مبيعا', style: AppStyle.fontbold16),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const ProductsGridList(),
        ],
      ),
    );
  }
}
