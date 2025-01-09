import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/entities/product_entity.dart';
import 'package:fruit_hub/core/error/failure.dart';
import 'package:fruit_hub/core/error/firebase_exception.dart';
import 'package:fruit_hub/core/repos/product_repo.dart';
import 'package:fruit_hub/core/utilies/constants.dart';
import 'package:get_it/get_it.dart';

import '../model/product_model.dart';
import '../services/firebase_firestore_service.dart';

class ProductRepoImpl implements ProductRepo {
  final FirebaseFirestoreService firebaseFirestoreService =
      GetIt.instance<FirebaseFirestoreService>();
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final result = await firebaseFirestoreService.readData(path: kProducts)
          as List<Map<String, dynamic>>;

      /// [{}, {}, {}]

      return right(result
          .map((e) => ProductModel.toProductEntity(ProductModel.fromJson(e)))
          .toList());
    } on ServiceException catch (error) {
      log('Error in ProductRepoImpl: getAllProducts => ${error.message}');
      return left(ServerFailure(error.message));
    }
  }
}
