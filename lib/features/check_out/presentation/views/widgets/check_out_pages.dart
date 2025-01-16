import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_views/check_out_cubit.dart';

class CheckOutPages extends StatelessWidget {
  const CheckOutPages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkoutCubit = BlocProvider.of<CheckOutCubit>(context);
    return Expanded(
      child: PageView.builder(
        controller: checkoutCubit.getPageController,
        onPageChanged: (value) {
          checkoutCubit.setCurrentPageIndex = value;
        },
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) => checkoutCubit.getCheckoutPages[index],
      ),
    );
  }
}
