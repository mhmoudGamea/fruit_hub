import 'package:dartz/dartz.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/error/firebase_exception.dart';
import '../../presentation/model_views/cart_cubit/cart_cubit.dart';
import '../entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<Exception, String>> addToCart(ProductEntity productEntity);

  Future<Either<Exception, String>> updateToCart(
      ProductEntity productEntity, Update type);

  Future<Either<Exception, void>> increaseItem(ProductEntity productEntity);

  Future<Either<Exception, void>> decreaseItem(ProductEntity productEntity);

  Future<Either<Exception, String>> removeFromCart();

  Future<Either<Exception, List<CartEntity>>> fetchCartItems();
}
