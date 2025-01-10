import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../model_views/home_cubit/home_cubit.dart';
// import '../../model_views/home_cubit/home_state.dart';
import '../../../../../core/utilies/constants.dart';
import 'products_grid_list_bloc_builder.dart';
import 'custom_home_app_bar.dart';
import 'custom_search.dart';
import '../../../../../core/widgets/custom_head_line.dart';
import 'offer_list.dart';

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
