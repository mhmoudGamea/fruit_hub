import 'package:flutter/material.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const rn = '/homeView';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
