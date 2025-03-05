import 'address_entity.dart';
import '../../../cart/domain/entity/cart_entity.dart';
import 'pay_entity.dart';

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
