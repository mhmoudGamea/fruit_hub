import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/domain/entities/pay_entity.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../domain/entities/address_entity.dart';
import '../../model_views/check_out_cubit.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context, listen: true);
    return CustomButton(
        onPressed: () {
          handleNavigation(context, checkOutCubit);
        },
        data: checkOutCubit.getButtonName(checkOutCubit.getCurrentPageIndex));
  }

  void handleNavigation(BuildContext context, CheckOutCubit checkOutCubit) {
    if (checkOutCubit.getCurrentPageIndex == 1) {
      if (checkOutCubit.getAddressFormKey.currentState!.validate()) {
        checkOutCubit.getAddressFormKey.currentState!.save();
        if (checkOutCubit.getPayMethod == Pay.cach) {
          checkOutCubit.navigate(
              context, checkOutCubit.getCurrentPageIndex + 2);
        } else {
          checkOutCubit.navigate(
              context, checkOutCubit.getCurrentPageIndex + 1);
        }
        checkOutCubit.getOrderEntity.isCach =
            checkOutCubit.getPayMethod == Pay.cach ? true : false;
        checkOutCubit.getOrderEntity.address = AddressEntity(
          name: checkOutCubit.name,
          email: checkOutCubit.email,
          number: checkOutCubit.phone,
          address: checkOutCubit.address,
          city: checkOutCubit.city,
          floor: checkOutCubit.floor,
        );
      } else {
        checkOutCubit.addressAutoValidate.value = AutovalidateMode.always;
      }
    } else if (checkOutCubit.getCurrentPageIndex == 2) {
      if (checkOutCubit.getPayFormKey.currentState!.validate()) {
        checkOutCubit.getPayFormKey.currentState!.save();
        checkOutCubit.navigate(context, checkOutCubit.getCurrentPageIndex + 1);
        checkOutCubit.getOrderEntity.pay = PayEntity(
            cardOwner: checkOutCubit.cardOwner,
            cardNumber: checkOutCubit.cardNumber,
            expiaryDate: checkOutCubit.expiaryDate,
            cvv: checkOutCubit.cvv);
      } else {
        checkOutCubit.payAutoValidate.value = AutovalidateMode.always;
      }
    } else {
      checkOutCubit.navigate(context, checkOutCubit.getCurrentPageIndex + 1);
    }
  }
}
