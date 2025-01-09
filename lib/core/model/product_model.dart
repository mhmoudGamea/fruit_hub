import 'dart:io';

import '../entities/product_entity.dart';
import '../entities/review_entity.dart';
import 'review_model.dart';

class ProductModel {
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
  final String? imageUrl;
  final List<ReviewModel> reviwesModel;

  ProductModel({
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
    this.avgRating = 0,
    this.ratingCount = 0,
    this.imageUrl,
    this.reviwesModel = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> map) => ProductModel(
        reviwesModel: [...map['reviews'].map((e) => ReviewModel.fromJson(e))],
        productName: map['productName'],
        productPrice: map['productPrice'],
        productCode: map['productCode'],
        productDescription: map['productDescription'],
        isFeatured: map['isFeatured'],
        productImage: map['productImage'],
        imageUrl: map['imageUrl'],
        expirationInYear: map['expirationInYear'],
        expirationInMonth: map['expirationInMonth'],
        isOrganic: map['isOrganic'],
        caloriesPerServing: map['caloriesPerServing'],
        servingSizeInGrams: map['servingSizeInGrams'],
        avgRating: map['avgRating'],
        ratingCount: map['ratingCount'],
      );

  static List<ReviewModel> getReviewsModelFromReviewsEntity(
      List<ReviewEntity> reviewsEntities) {
    return reviewsEntities.map((e) => ReviewModel.fromEntity(e)).toList();
  }

  static List<ReviewEntity> getReviewsEntityFromReviewsModel(
      List<ReviewModel> reviewModel) {
    return reviewModel.map((e) => ReviewModel.toEntity(e)).toList();
  }

  factory ProductModel.fromEntity(ProductEntity productEntity) => ProductModel(
        reviwesModel:
            getReviewsModelFromReviewsEntity(productEntity.reviwesEntities),
        productName: productEntity.productName,
        productPrice: productEntity.productPrice,
        productCode: productEntity.productCode,
        productDescription: productEntity.productDescription,
        isFeatured: productEntity.isFeatured,
        productImage: productEntity.productImage,
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
      productImage: productModel.productImage,
      expirationInYear: productModel.expirationInYear,
      expirationInMonth: productModel.expirationInMonth,
      isOrganic: productModel.isOrganic,
      caloriesPerServing: productModel.caloriesPerServing,
      servingSizeInGrams: productModel.servingSizeInGrams,
      avgRating: productModel.avgRating,
      imageUrl: productModel.imageUrl,
      ratingCount: productModel.ratingCount,
      reviwesEntities:
          getReviewsEntityFromReviewsModel(productModel.reviwesModel),
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
