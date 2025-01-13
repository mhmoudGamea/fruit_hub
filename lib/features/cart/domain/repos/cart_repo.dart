import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/cart/domain/entity/cart_entity.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/error/firebase_exception.dart';

abstract class CartRepo {
  Future<Either<Exception, String>> addToCart(ProductEntity productEntity);

  Future<Either<Exception, String>> updateToCart(ProductEntity productEntity);

  Future<Either<Exception, String>> removeFromCart();

  Future<Either<Exception, List<CartEntity>>> fetchCartItems();
}
