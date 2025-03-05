import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_colors.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/check_out_cubit/check_out_cubit.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CheckOutCubit>(context);
    return Container(
      height: 128,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColors.backgroundItemColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'المجموع الفرعي :',
                    style: AppStyle.fontregular13,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'التوصيل  :',
                    style: AppStyle.fontregular13,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${cubit.getOrderEntity.totalPrice} جنيه',
                      style: AppStyle.fontsemi16
                          .copyWith(color: const Color(0xff6c7275))),
                  const SizedBox(height: 8),
                  Text('30 جنية',
                      style: AppStyle.fontsemi13
                          .copyWith(color: const Color(0xff6c7275))),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(color: Color(0xffCACECE), height: 1.2),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('الكلي', style: AppStyle.fontbold16),
              const SizedBox(height: 8),
              Text('${cubit.getOrderEntity.totalPrice + 30} جنيه',
                  style: AppStyle.fontbold16),
            ],
          )
        ],
      ),
    );
  }
}
