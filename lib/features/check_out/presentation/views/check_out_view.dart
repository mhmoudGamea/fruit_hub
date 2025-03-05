import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/order_cubit/order_cubit.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../domain/repos/order_repo_impl.dart';
import '../model_views/check_out_cubit/check_out_cubit.dart';
import 'widgets/check_out_view_body.dart';

class CheckOutView extends StatelessWidget {
  static const rn = '/checkout';
  final OrderEntity orderEntity;
  const CheckOutView({super.key, required this.orderEntity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CheckOutCubit()),
        BlocProvider(create: (context) => OrderCubit(OrderRepoImpl())),
      ],
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
