import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/cart/presentation/model_views/cart_cubit/cart_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/error/firebase_exception.dart';
import '../../../../core/services/firebase_cart_service.dart';
import '../../data/cart_model.dart';
import '../entity/cart_entity.dart';
import 'cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final FirebaseCartService _firebaseCartService =
      GetIt.instance<FirebaseCartService>();

  @override
  Future<Either<Exception, String>> addToCart(
      ProductEntity productEntity) async {
    try {
      CartEntity cartEntity =
          CartEntity(productEntity: productEntity, count: 1, unit: 1);
      var data = CartModel.toJson(CartModel.fromCartEntity(cartEntity));
      await _firebaseCartService.addToCart(
          data: data, documentId: productEntity.productCode);
      return right(
          'تمت إضافه عنصر ${productEntity.productName} إلي السله بنجاح');
    } on ServiceException catch (error) {
      return left(ServiceException(error.message));
    }
  }

  @override
  Future<Either<Exception, String>> updateToCart(
      ProductEntity productEntity, Update type) async {
    try {
      Map<String, FieldValue> data;
      if (type == Update.increment) {
        data = {
          'count': FieldValue.increment(1),
          'unit': FieldValue.increment(1),
        };
      } else {
        data = {
          'count': FieldValue.increment(-1),
          'unit': FieldValue.increment(-1),
        };
      }
      await _firebaseCartService.updateItemInCart(
          productEntity.productCode, data);
      return right('لقد قمت بإضافة ${productEntity.productName} أخرى إلى سلتك');
    } on ServiceException catch (error) {
      return left(ServiceException(error.message));
    }
  }

  @override
  Future<Either<Exception, void>> decreaseItem(ProductEntity productEntity) {
    // TODO: implement decreaseItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, void>> increaseItem(ProductEntity productEntity) {
    // TODO: implement increaseItem
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, String>> removeFromCart() {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Exception, List<CartEntity>>> fetchCartItems() async {
    try {
      final response = await _firebaseCartService.getAllItemsInCart();
      final List<CartEntity> cartEntityList = response
          .map((data) => CartModel.toCartEntity(CartModel.fromJson(data)))
          .toList();
      return right(cartEntityList);
    } on ServiceException catch (error) {
      return left(ServiceException(error.message));
    }
  }
}
