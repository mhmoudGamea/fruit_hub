import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/check_out_cubit.dart';

import '../../../../../core/config/app_colors.dart';
import 'active_dot.dart';
import 'in_active_dot.dart';

class PurchaseMethos extends StatelessWidget {
  const PurchaseMethos({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.pay,
    this.isSelected = false,
  });

  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final Pay pay;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CheckOutCubit>().tooglePayMethod(pay);
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0x33D9D9D9),
            border: Border.all(
                width: 1,
                color:
                    isSelected ? AppColors.primaryColor : Colors.transparent),
            borderRadius: BorderRadius.circular(4),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isSelected ? const ActiveDot() : const InActiveDot(),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppStyle.fontsemi13,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: AppStyle.fontregular13
                          .copyWith(color: const Color(0x80000000)),
                    ),
                  ],
                ),
                const Spacer(),
                Center(
                  child: Text(
                    price,
                    style: AppStyle.fontbold13
                        .copyWith(color: AppColors.primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
