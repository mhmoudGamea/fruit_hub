import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubits/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';
import '../../../core/widgets/custom_bottom_navigation_bar.dart';
import '../../home/presentation/views/home_view.dart';

class MainView extends StatelessWidget {
  static const rn = '/mainView';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeView(),
      bottomNavigationBar: BlocProvider(
        create: (context) => BottomNavigationCubit(),
        child: const CustomBottomNavigationBar(),
      ),
    );
  }
}
