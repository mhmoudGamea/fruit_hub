import 'package:fruit_hub/core/entities/product_entity.dart';

class CartEntity {
  final ProductEntity productEntity;
  int count;
  double unit;

  CartEntity({
    required this.productEntity,
    this.count = 0,
    this.unit = 0.0,
  });
}
