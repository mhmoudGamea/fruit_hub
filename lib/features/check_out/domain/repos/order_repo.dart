import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failure.dart';
import 'package:fruit_hub/features/check_out/domain/entities/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
}
