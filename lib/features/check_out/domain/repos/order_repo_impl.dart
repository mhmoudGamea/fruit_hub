import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/firebase_order_service.dart';
import 'package:fruit_hub/features/check_out/data/order_model.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/error/failure.dart';
import '../entities/order_entity.dart';
import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final FirebaseOrderService _firebaseOrderService =
      GetIt.instance<FirebaseOrderService>();
  @override
  Future<Either<Failure, void>> addOrder(
      {required OrderEntity orderEntity}) async {
    log(orderEntity.address!.toString());
    try {
      final data = OrderModel.toJson(OrderModel.fromOrderEntity(orderEntity));
      await _firebaseOrderService.addOrder(data: data);
      return right(null);
    } catch (error) {
      return left(ServerFailure(error.toString()));
    }
  }
}
