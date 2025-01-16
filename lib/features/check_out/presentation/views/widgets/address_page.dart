import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/core/widgets/custom_text_form_field.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextFormField(
            hint: 'الاسم كامل', inputType: TextInputType.name),
        const SizedBox(height: 8),
        const CustomTextFormField(
            hint: 'البريد الإلكتروني', inputType: TextInputType.name),
        const SizedBox(height: 8),
        const CustomTextFormField(
            hint: 'العنوان', inputType: TextInputType.name),
        const SizedBox(height: 8),
        const CustomTextFormField(
            hint: 'المدينه', inputType: TextInputType.name),
        const SizedBox(height: 8),
        const CustomTextFormField(
            hint: 'رقم الطابق , رقم الشقه ..', inputType: TextInputType.name),
        const SizedBox(height: 8),
        Row(
          children: [
            Switch(
              // activeColor: AppColors.backgroundItemColor,

              activeTrackColor: AppColors.primaryColor,
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(width: 5),
            Text(
              'حفظ العنوان',
              style:
                  AppStyle.fontsemi13.copyWith(color: const Color(0xff949D9E)),
            ),
          ],
        ),
      ],
    );
  }
}
