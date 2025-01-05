import 'package:flutter/material.dart';
import 'widgets/best_seller_view_body.dart';

class BestSellerView extends StatelessWidget {
  static const rn = '/bestSellerView';
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BestSellerViewBody(),
      ),
      // bottomNavigationBar: BlocProvider(
      //   create: (context) => BottomNavigationCubit(),
      //   child: const CustomBottomNavigationBar(),
      // ),
    );
  }
}
