import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/features/best_seller/presentation/views/best_seller_view.dart';
import 'package:go_router/go_router.dart';

class HeadLineHomeItem extends StatelessWidget {
  const HeadLineHomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              GoRouter.of(context).push(BestSellerView.rn);
            },
            child: const Text('الأكثر مبيعًا', style: AppStyle.fontbold16)),
        const Spacer(),
        Text(
          'المزيد',
          style: AppStyle.fontregular13.copyWith(
            color: const Color(0xff949D9E),
          ),
        ),
      ],
    );
  }
}
