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
      builder: (context, state) {
        if (bottomNavigationCubit.getSelectedIndex == 0) {
          return const HomeView();
        } else if (bottomNavigationCubit.getSelectedIndex == 1) {
          return const OurProductsView();
        } else if (bottomNavigationCubit.getSelectedIndex == 2) {
          return Container(
            color: Colors.amber,
          );
        } else {
          return Container(
            color: Colors.red,
          );
        }
      },
    );
  }
}
