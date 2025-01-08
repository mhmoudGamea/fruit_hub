import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/config/app_style.dart';

class CustomSocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final String socialMediaLogo;
  const CustomSocialButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.socialMediaLogo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 56,
        padding: const EdgeInsets.only(right: 17),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xffDDDFDF),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              socialMediaLogo,
              width: 20,
            ),
            const SizedBox(width: 20),
            FittedBox(
              child: Text(
                text,
                style: AppStyle.fontsemi16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
