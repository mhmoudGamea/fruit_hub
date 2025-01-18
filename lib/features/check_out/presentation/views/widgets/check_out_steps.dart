import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/domain/entities/address_entity.dart';

import '../../../domain/entities/pay_entity.dart';
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
            // checkOutCubit.navigate(context, index);
            if (checkOutCubit.getCurrentPageIndex == 1) {
              if (checkOutCubit.getAddressFormKey.currentState!.validate()) {
                checkOutCubit.getAddressFormKey.currentState!.save();
                checkOutCubit.navigate(context, index);
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
                checkOutCubit.addressAutoValidate.value =
                    AutovalidateMode.always;
              }
            } else if (checkOutCubit.getCurrentPageIndex == 2) {
              if (checkOutCubit.getPayFormKey.currentState!.validate()) {
                checkOutCubit.getPayFormKey.currentState!.save();
                checkOutCubit.navigate(context, index);
                checkOutCubit.getOrderEntity.pay = PayEntity(
                    cardOwner: checkOutCubit.cardOwner,
                    cardNumber: checkOutCubit.cardNumber,
                    expiaryDate: checkOutCubit.expiaryDate,
                    cvv: checkOutCubit.cvv);
              } else {
                checkOutCubit.payAutoValidate.value = AutovalidateMode.always;
              }
            } else {
              checkOutCubit.navigate(context, index);
            }
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
