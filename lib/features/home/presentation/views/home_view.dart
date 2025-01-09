import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model_views/home_cubit/home_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const rn = '/homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocProvider(
          create: (context) => HomeCubit()..getProducts(),
          child: const HomeViewBody(),
        ),
      ),
    );
  }
}
