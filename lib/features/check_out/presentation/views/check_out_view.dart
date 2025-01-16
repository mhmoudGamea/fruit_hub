import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../model_views/check_out_cubit.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  static const rn = '/checkout';
  final OrderEntity orderEntity;
  const CheckOutView({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit(),
      child: Builder(builder: (context) {
        context.read<CheckOutCubit>().setOrderEntity = orderEntity;
        return Scaffold(
          appBar: CustomAppBar.customAuthAppBar(context, title: 'الشحن'),
          body: const CheckOutViewBody(),
        );
      }),
    );
  }
}
