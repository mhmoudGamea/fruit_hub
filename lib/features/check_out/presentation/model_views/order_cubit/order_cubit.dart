import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utilies/helper.dart';
import 'package:fruit_hub/features/check_out/domain/repos/order_repo.dart';
import 'package:fruit_hub/features/check_out/presentation/model_views/order_cubit/order_state.dart';

import '../../../domain/entities/order_entity.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this._orderRepo) : super(OrderInitial());

  final OrderRepo _orderRepo;

  Future<void> addOrder(BuildContext context, OrderEntity orderEntity) async {
    emit(OrderAddLoading());
    final response = await _orderRepo.addOrder(orderEntity: orderEntity);
    response.fold((fail) {
      emit(OrderAddFailure());
      Helper.errorMessage(context, message: fail.message);
    }, (success) {
      emit(OrderAddSuccess());
    });
  }
}
