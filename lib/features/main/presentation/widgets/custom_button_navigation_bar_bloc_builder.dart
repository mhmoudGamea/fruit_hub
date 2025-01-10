import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import 'package:fruit_hub/core/cubits/bottom_navigation_bar_cubit/bottom_navigation_state.dart';
import 'package:fruit_hub/features/our_products/presentation/views/our_products_view.dart';

import '../../../home/presentation/views/home_view.dart';

class CustomButtonNavigationBarBlocBuilder extends StatelessWidget {
  const CustomButtonNavigationBarBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationCubit =
        BlocProvider.of<BottomNavigationCubit>(context);
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) => IndexedStack(
        index: bottomNavigationCubit.getSelectedIndex,
        children: [
          const HomeView(),
          const OurProductsView(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}
