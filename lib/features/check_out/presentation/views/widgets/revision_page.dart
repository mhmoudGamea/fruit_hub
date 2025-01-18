import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/config/app_style.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/check_out_cubit.dart';

import 'address_confirmation.dart';
import 'order_confirmation.dart';
import 'order_summery.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('ملخص الطلب :', style: AppStyle.fontbold13),
          const SizedBox(height: 8),
          const OrderSummery(),
          const SizedBox(height: 16),
          if (context.read<CheckOutCubit>().getPayMethod == Pay.card)
            const Column(
              children: [
                Text('يرجي تأكيد  طلبك', style: AppStyle.fontbold13),
                SizedBox(height: 8),
                OrderConfirmation(),
                SizedBox(height: 16),
              ],
            ),
          const Text('يرجي تأكيد  عنوانك', style: AppStyle.fontbold13),
          const SizedBox(height: 8),
          const AddressConfirmation(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
