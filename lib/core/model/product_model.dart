import 'package:fruit_hub/core/utilies/helper.dart';

import '../entities/product_entity.dart';
import 'review_model.dart';

class ProductModel {
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
  final List<ReviewModel> reviwesModel;

  ProductModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.expirationInYear,
    required this.expirationInMonth,
    required this.caloriesPerServing,
    required this.servingSizeInGrams,
    required this.isOrganic,
    required this.isFeatured,
    required this.imageUrl,
    this.avgRating = 0,
    this.ratingCount = 0,
    this.reviwesModel = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) => ProductModel(
        reviwesModel: [...map['reviews'].map((e) => ReviewModel.fromJson(e))],
        productName: map['productName'],
        productPrice: map['productPrice'],
        productCode: map['productCode'],
        productDescription: map['productDescription'],
        isFeatured: map['isFeatured'],
        imageUrl: map['imageUrl'],
        expirationInYear: map['expirationInYear'],
        expirationInMonth: map['expirationInMonth'],
        isOrganic: map['isOrganic'],
        caloriesPerServing: map['caloriesPerServing'],
        servingSizeInGrams: map['servingSizeInGrams'],
        avgRating: Helper.getAvgRating([
          ...map['reviews']
              .map((e) => ReviewModel.toEntity(ReviewModel.fromJson(e)))
        ]),
        ratingCount: map['ratingCount'],
      );

  factory ProductModel.fromEntity(ProductEntity productEntity) => ProductModel(
        reviwesModel: Helper.getReviewsModelFromReviewsEntity(
            productEntity.reviwesEntities),
        productName: productEntity.productName,
        productPrice: productEntity.productPrice,
        productCode: productEntity.productCode,
        productDescription: productEntity.productDescription,
        isFeatured: productEntity.isFeatured,
        imageUrl: productEntity.imageUrl,
        expirationInYear: productEntity.expirationInYear,
        expirationInMonth: productEntity.expirationInMonth,
        isOrganic: productEntity.isOrganic,
        caloriesPerServing: productEntity.caloriesPerServing,
        servingSizeInGrams: productEntity.servingSizeInGrams,
        avgRating: productEntity.avgRating,
        ratingCount: productEntity.ratingCount,
      );

  static ProductEntity toProductEntity(ProductModel productModel) {
    return ProductEntity(
      productName: productModel.productName,
      productPrice: productModel.productPrice,
      productCode: productModel.productCode,
      productDescription: productModel.productDescription,
      isFeatured: productModel.isFeatured,
      expirationInYear: productModel.expirationInYear,
      expirationInMonth: productModel.expirationInMonth,
      isOrganic: productModel.isOrganic,
      caloriesPerServing: productModel.caloriesPerServing,
      servingSizeInGrams: productModel.servingSizeInGrams,
      avgRating: productModel.avgRating,
      imageUrl: productModel.imageUrl,
      ratingCount: productModel.ratingCount,
      reviwesEntities:
          Helper.getReviewsEntityFromReviewsModel(productModel.reviwesModel),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCode': productCode,
      'productDescription': productDescription,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationInYear': expirationInYear,
      'expirationInMonth': expirationInMonth,
      'isOrganic': isOrganic,
      'caloriesPerServing': caloriesPerServing,
      'servingSizeInGrams': servingSizeInGrams,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviwesModel.map((review) => review.toJson()).toList(),

      /// [ {}, {}, {} ]
    };
  }
}
