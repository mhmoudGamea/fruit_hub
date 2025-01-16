import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../model_views/check_out_cubit.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context, listen: true);
    return CustomButton(
        onPressed: () {
          checkOutCubit.navigate(
              context, checkOutCubit.getCurrentPageIndex + 1);
        },
        data: checkOutCubit.getButtonName(checkOutCubit.getCurrentPageIndex));
  }
}
