import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub/core/widgets/fruit_item.dart';

import '../../../../../core/utilies/constants.dart';
import 'custom_home_app_bar.dart';
import 'custom_search.dart';
import 'head_line_home_item.dart';
import 'offer_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: authViewPadding),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                Column(
                  children: [
                    SizedBox(height: 16),
                    CustomSearch(),
                    SizedBox(height: 12),
                    OfferList(),
                    SizedBox(height: 12),
                    HeadLineHomeItem(),
                    SizedBox(height: 8),
                  ],
                )
              ],
            ),
          ),
          SliverGrid.builder(
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
          ),
        ],
      ),
    );
  }
}
