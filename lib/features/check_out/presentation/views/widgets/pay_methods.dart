import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';

class PayMethods extends StatelessWidget {
  const PayMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        PayMethosItem(image: AppImages.applepay),
        SizedBox(width: 16),
        PayMethosItem(image: AppImages.paypal),
        SizedBox(width: 16),
        PayMethosItem(image: AppImages.mastercard),
        SizedBox(width: 16),
        PayMethosItem(image: AppImages.visa, bgColor: Color(0xff1434CB)),
      ],
    );
  }
}

class PayMethosItem extends StatelessWidget {
  const PayMethosItem(
      {super.key,
      required this.image,
      this.bgColor = Colors.white,
      this.height,
      this.width});
  final String image;
  final Color bgColor;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 43,
      width: width ?? 67,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          width: 1,
          color: const Color(0xffD6DCE5),
        ),
        // image: const DecorationImage(image: AssetImage(AppImages.visa)),
      ),
      child: SvgPicture.asset(image),
    );
  }
}
