import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utilies/constants.dart';
import 'custom_home_app_bar.dart';
import 'custom_search.dart';
import 'head_line_home_item.dart';
import 'offer_list.dart';
import 'fruit_grid_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

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
                    OfferList(),
                    SizedBox(height: 12),
                    HeadLineHomeItem(),
                    SizedBox(height: 8),
                  ],
                )
              ],
            ),
          ),
          FruitGridList(),
        ],
      ),
    );
  }
}
