import 'package:fruit_hub/features/check_out/domain/entities/pay_entity.dart';

import 'address_entity.dart';
import '../../../cart/domain/entity/cart_entity.dart';

class OrderEntity {
  final List<CartEntity> cartEntity;
  final double totalPrice;
  final String uid;
  bool? isCach;
  AddressEntity? address;
  PayEntity? pay;

  OrderEntity(
      {required this.cartEntity, required this.totalPrice, required this.uid});
}
