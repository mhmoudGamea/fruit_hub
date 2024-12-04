import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
            height: 1,
            thickness: 1,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'أو',
          style: AppStyle.fontsemi16.copyWith(
            color: const Color(0xff0C0D0D),
          ),
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Divider(
            color: Color(0xffDDDFDF),
            height: 1,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}
