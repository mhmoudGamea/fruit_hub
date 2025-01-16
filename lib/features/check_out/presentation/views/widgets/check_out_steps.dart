import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model_views/check_out_cubit.dart';
import 'step_item.dart';

class CheckOutSteps extends StatelessWidget {
  const CheckOutSteps({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context, listen: true);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => InkWell(
          onTap: () {
            checkOutCubit.navigate(context, index);
          },
          child: StepItem(
            title: checkOutCubit.getCheckOutStepsNames[index],
            index: index + 1,
            isActive: checkOutCubit.getCurrentPageIndex >= index,
          ),
        ),
      ),
    );
  }
}
