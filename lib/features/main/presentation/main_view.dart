import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/model_views/home_cubit/products_cubit.dart';

import '../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import 'widgets/custom_button_navigation_bar_bloc_builder.dart';

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
      ],
      child: const Scaffold(
        body: CustomButtonNavigationBarBlocBuilder(),
        bottomNavigationBar: CustomBottomNavigationBar(),
      ),
    );
  }
}
