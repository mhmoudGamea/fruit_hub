import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../model_views/check_out_cubit/check_out_cubit.dart';
import 'save_my_address_switch_button.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
    log('mmmmmmmmmmmmmmmmmmmmm: ${checkOutCubit.name}');

    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: checkOutCubit.addressAutoValidate,
        builder: (context, value, _) => Form(
          key: checkOutCubit.getAddressFormKey,
          autovalidateMode: value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hint: 'الاسم كامل',
                inputType: TextInputType.name,
                onSaved: (p0) => checkOutCubit.setName = p0!,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hint: 'البريد الإلكتروني',
                inputType: TextInputType.emailAddress,
                onSaved: (p0) => checkOutCubit.setEmail = p0!,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hint: 'رقم التليفون',
                inputType: TextInputType.phone,
                onSaved: (p0) => checkOutCubit.setPhone = p0!,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hint: 'العنوان',
                inputType: TextInputType.name,
                onSaved: (p0) => checkOutCubit.setAddress = p0!,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hint: 'المدينه',
                inputType: TextInputType.name,
                onSaved: (p0) => checkOutCubit.setCity = p0!,
              ),
              const SizedBox(height: 8),
              CustomTextFormField(
                hint: 'رقم الطابق , رقم الشقه ..',
                inputType: TextInputType.name,
                onSaved: (p0) => checkOutCubit.setFloor = p0!,
              ),
              const SizedBox(height: 8),
              const SaveMyAddressSwitchButton(),
            ],
          ),
        ),
      ),
    );
  }
}
