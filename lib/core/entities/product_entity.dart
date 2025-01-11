import '../model/review_model.dart';
import 'review_entity.dart';

class ProductEntity {
  final String productName;
  final String productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeatured;
  final int expirationInYear;
  final int expirationInMonth;
  final bool isOrganic;
  final int caloriesPerServing; //80
  final int servingSizeInGrams; //100g
  final num avgRating;
  final num ratingCount;
  final String imageUrl;
  final List<ReviewEntity> reviwesEntities;

  ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.isFeatured,
    required this.expirationInYear,
    required this.expirationInMonth,
    required this.isOrganic,
    required this.caloriesPerServing,
    required this.servingSizeInGrams,
    required this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.reviwesEntities = const [],
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productCode: json['productCode'],
      productDescription: json['productDescription'],
      isFeatured: json['isFeatured'],
      expirationInYear: json['expirationInYear'],
      expirationInMonth: json['expirationInMonth'],
      isOrganic: json['isOrganic'],
      caloriesPerServing: json['caloriesPerServing'],
      servingSizeInGrams: json['servingSizeInGrams'],
      avgRating: json['avgRating'] ?? 0,
      ratingCount: json['ratingCount'] ?? 0,
      imageUrl: json['imageUrl'],
      reviwesEntities: [
        ...json['reviews']
            .map((e) => ReviewModel.toEntity(ReviewModel.fromJson(e)))
      ],
    );
  }
}
