import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/error/failure.dart';

import '../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
