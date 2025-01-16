import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/check_out_cubit.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/check_out_state.dart';

import 'shipping_methos.dart';

class ShippingPage extends StatelessWidget {
  const ShippingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CheckOutCubit>(context);
    return BlocBuilder<CheckOutCubit, CheckOutState>(
      builder: (context, state) {
        return Column(
          children: [
            PurchaseMethos(
              title: 'الدفع عند الاستلام',
              subtitle: 'التسليم من المكان',
              price: (cubit.getOrderEntity.totalPrice + 30).toString(),
              pay: Pay.cach,
              isSelected: cubit.getPayMethod == Pay.cach,
            ),
            const SizedBox(height: 32),
            PurchaseMethos(
              title: 'الدفع اونلاين',
              subtitle: 'يرجي تحديد طريقه الدفع',
              price: (cubit.getOrderEntity.totalPrice).toString(),
              pay: Pay.card,
              isSelected: cubit.getPayMethod == Pay.card,
            ),
          ],
        );
      },
    );
  }
}
