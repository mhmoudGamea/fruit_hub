import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/check_out_cubit.dart';

import '../../../../../core/config/app_style.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'pay_methods.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: checkOutCubit.payAutoValidate,
        builder: (context, value, _) => Form(
          key: checkOutCubit.getPayFormKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'أختار طريقه الدفع المناسبه :',
                style: AppStyle.fontbold13,
              ),
              const SizedBox(height: 13),
              const PayMethods(),
              const SizedBox(height: 13),
              CustomTextFormField(
                hint: 'اسم حامل البطاقه',
                inputType: TextInputType.name,
                onSaved: (p0) => checkOutCubit.setCardOwner = p0!,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hint: 'رقم البطاقة',
                inputType: TextInputType.name,
                onSaved: (p0) => checkOutCubit.setCardNumber = p0!,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hint: 'تاريخ الصلاحيه',
                      inputType: TextInputType.name,
                      onSaved: (p0) => checkOutCubit.setExpiaryDate = p0!,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextFormField(
                      hint: 'CVV',
                      inputType: TextInputType.name,
                      onSaved: (p0) => checkOutCubit.setcvv = p0!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
