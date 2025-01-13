import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/domain/repos/cart_repo_impl.dart';
import 'package:fruit_hub/features/cart/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:fruit_hub/features/home/presentation/model_views/home_cubit/products_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import 'widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  static const rn = '/mainView';
  const MainView({super.key});

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
        BlocProvider<CartCubit>(
          create: (BuildContext context) =>
              CartCubit(GetIt.instance<CartRepoImpl>())..fetchAndSet(),
        ),
      ],
      child: const Scaffold(
        body: MainViewBody(),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
