import 'package:fruit_hub/core/entities/product_entity.dart';

class CartEntity {
  final ProductEntity productEntity;
  int count;
  int unit;

  CartEntity({
    required this.productEntity,
    this.count = 0,
    this.unit = 0,
  });
}
