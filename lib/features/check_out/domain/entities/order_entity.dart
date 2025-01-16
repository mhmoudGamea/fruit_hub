import 'address_entity.dart';
import '../../../cart/domain/entity/cart_entity.dart';

class OrderEntity {
  final List<CartEntity> cartEntity;
  final double totalPrice;
  bool? isCach;
  AddressEntity? address;

  OrderEntity({required this.cartEntity, required this.totalPrice});
}
