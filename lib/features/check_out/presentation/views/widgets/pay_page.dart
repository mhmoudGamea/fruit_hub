import 'package:flutter/material.dart';

import '../../../../../core/config/app_style.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'pay_check_box.dart';
import 'pay_methods.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'أختار طريقه الدفع المناسبه :',
          style: AppStyle.fontbold13,
        ),
        SizedBox(height: 13),
        Text(
          'من فضلك اختر طريقه الدفع المناسبه لك.',
          style: AppStyle.fontregular13,
        ),
        SizedBox(height: 13),
        PayMethods(),
        SizedBox(height: 13),
        CustomTextFormField(
            hint: 'اسم حامل البطاقه', inputType: TextInputType.name),
        SizedBox(height: 8),
        CustomTextFormField(hint: 'رقم البطاقة', inputType: TextInputType.name),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  hint: 'تاريخ الصلاحيه', inputType: TextInputType.name),
            ),
            SizedBox(width: 8),
            Expanded(
              child: CustomTextFormField(
                  hint: 'CVV', inputType: TextInputType.name),
            ),
          ],
        ),
        SizedBox(height: 17),
        // CustomCheckBox(),
        PayCheckBox()
      ],
    );
  }
}
