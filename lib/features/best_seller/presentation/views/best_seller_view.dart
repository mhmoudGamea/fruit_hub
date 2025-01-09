import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import '../../../../core/widgets/custom_bottom_navigation_bar.dart';
import 'widgets/best_seller_view_body.dart';

class BestSellerView extends StatelessWidget {
  static const rn = '/bestSellerView';
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: BestSellerViewBody(),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: const CustomBottomNavigationBar(),
      ),
    );
  }
}
