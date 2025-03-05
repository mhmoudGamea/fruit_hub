import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utilies/helper.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../model_views/check_out_cubit/check_out_cubit.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context, listen: true);
    return CustomButton(
      onPressed: () {
        handleNavigation(context, checkOutCubit);
      },
      data: checkOutCubit.getButtonName(checkOutCubit.getCurrentPageIndex),
    );
  }

  void handleNavigation(BuildContext context, CheckOutCubit checkOutCubit) {
    if (checkOutCubit.getCurrentPageIndex == 1) {
      _handleAddressValidation(checkOutCubit, context);
    } else if (checkOutCubit.getCurrentPageIndex == 2) {
      _handlePayValidation(checkOutCubit, context);
    } else if (checkOutCubit.getCurrentPageIndex == 3) {
      if (checkOutCubit.getPayMethod == Pay.card) {
        Helper.paypalNavigation(context, checkOutCubit);
      }
    } else {
      // checkOutCubit.getCurrentPageIndex == 0
      checkOutCubit.navigate(context, checkOutCubit.getCurrentPageIndex + 1);
    }
  }

  void _handleAddressValidation(
      CheckOutCubit checkOutCubit, BuildContext context) {
    if (checkOutCubit.getAddressFormKey.currentState!.validate()) {
      checkOutCubit.getAddressFormKey.currentState!.save();
      if (checkOutCubit.getPayMethod == Pay.cach) {
        // don't show payPage go direct to page 3 => revision
        checkOutCubit.navigate(context, checkOutCubit.getCurrentPageIndex + 2);
      } else {
        checkOutCubit.navigate(context, checkOutCubit.getCurrentPageIndex + 1);
      }
      checkOutCubit.getOrderEntity.isCach =
          checkOutCubit.getPayMethod == Pay.cach ? true : false;
      checkOutCubit.getOrderEntity.address = checkOutCubit.getAddressEntity();
    } else {
      checkOutCubit.addressAutoValidate.value = AutovalidateMode.always;
    }
  }

  void _handlePayValidation(CheckOutCubit checkOutCubit, BuildContext context) {
    if (checkOutCubit.getPayFormKey.currentState!.validate()) {
      checkOutCubit.getPayFormKey.currentState!.save();
      checkOutCubit.navigate(context, checkOutCubit.getCurrentPageIndex + 1);
      checkOutCubit.getOrderEntity.pay = checkOutCubit.getPayEntity();
    } else {
      checkOutCubit.payAutoValidate.value = AutovalidateMode.always;
    }
  }
}
