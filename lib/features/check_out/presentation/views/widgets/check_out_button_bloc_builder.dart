import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/order_cubit/order_cubit.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/order_cubit/order_state.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/check_out_button.dart';

class CheckOutButtonBlocBuilder extends StatelessWidget {
  const CheckOutButtonBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state is OrderAddLoading) {
          return const CircularProgressIndicator();
        } else if (state is OrderAddFailure) {
          return const Text('faillled');
        } else {
          return const CheckOutButton();
        }
      },
    );
  }
}
