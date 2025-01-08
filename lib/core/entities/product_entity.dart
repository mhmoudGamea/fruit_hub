import 'dart:io';

import 'review_entity.dart';

class ProductEntity {
  final String productName;
  final String productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeatured;
  final File productImage;
  final int expirationInYear;
  final int expirationInMonth;
  final bool isOrganic;
  final int caloriesPerServing; //80
  final int servingSizeInGrams; //100g
  final num avgRating;
  final num ratingCount;
  String? imageUrl;
  final List<ReviewEntity> reviwesEntities;

  ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.isFeatured,
    required this.productImage,
    required this.expirationInYear,
    required this.expirationInMonth,
    required this.isOrganic,
    required this.caloriesPerServing,
    required this.servingSizeInGrams,
    this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.reviwesEntities = const [],
  });
}
