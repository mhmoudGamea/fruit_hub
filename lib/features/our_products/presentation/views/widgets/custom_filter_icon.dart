import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utilies/app_images.dart';
import 'package:fruit_hub/core/utilies/helper.dart';

class CustomFilterIcon extends StatelessWidget {
  const CustomFilterIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Helper.showOrderingBottomModelSheet(context);
      },
      child: Container(
        width: 50,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xffCACECE),
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppImages.filterIcon,
          ),
        ),
      ),
    );
  }
}
