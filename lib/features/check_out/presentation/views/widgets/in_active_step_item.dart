import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

class InActiveStepItem extends StatelessWidget {
  final int stepNumber;
  final String title;

  const InActiveStepItem(
      {super.key, required this.title, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffF2F3F3),
          ),
          child: Text(
            stepNumber.toString(),
            style: AppStyle.fontregular13.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          title,
          style: AppStyle.fontbold13.copyWith(color: const Color(0xffAAAAAA)),
        ),
      ],
    );
  }
}
