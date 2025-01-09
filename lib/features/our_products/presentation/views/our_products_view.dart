import 'package:flutter/material.dart';

import 'widgets/our_products_view_body.dart';

class OurProductsView extends StatelessWidget {
  const OurProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: OurProductsViewBody(),
    );
  }
}
