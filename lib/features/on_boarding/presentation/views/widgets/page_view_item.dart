import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/config/app_style.dart';

class PageViewItem extends StatelessWidget {
  final String image, bgImage;
  final Widget title;
  final String subtitle;
  const PageViewItem(
      {super.key,
      required this.image,
      required this.bgImage,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          bgImage,
          fit: BoxFit.fill,
        ),
        Positioned(
          top: 140,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                image,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 60),
              title,
              const SizedBox(height: 24),
              Text(
                subtitle,
                style: AppStyle.font13,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Positioned(
          top: 40,
          right: 15,
          child: InkWell(
            onTap: () => print('hi flutter'),
            child: Text(
              'تخط',
              style: AppStyle.font13.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
