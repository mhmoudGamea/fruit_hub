import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
// import '../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import '../../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../../home/presentation/model_views/home_cubit/products_cubit.dart';
import 'widgets/best_seller_view_body.dart';

class BestSellerView extends StatelessWidget {
  static const rn = '/bestSellerView';
  const BestSellerView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsCubit>(
          create: (BuildContext context) => ProductsCubit()..getProducts(),
        ),
        BlocProvider<BottomNavigationCubit>(
          create: (BuildContext context) => BottomNavigationCubit(),
        ),
      ],
      child: const Scaffold(
        body: SafeArea(
          child: BestSellerViewBody(),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
