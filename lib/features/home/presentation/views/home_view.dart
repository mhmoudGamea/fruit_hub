import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import 'package:fruit_hub/core/widgets/custom_bottom_navigation_bar.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const rn = '/homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: HomeViewBody(),
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: const CustomBottomNavigationBar(),
      ),
    );
  }
}
