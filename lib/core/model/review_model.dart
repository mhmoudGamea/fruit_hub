import '../entities/review_entity.dart';

class ReviewModel {
  final String reviewerImage;
  final String reviewerName;
  final String reviewDate;
  final String review;
  final num reviewRating;

  ReviewModel({
    required this.reviewerImage,
    required this.reviewerName,
    required this.reviewDate,
    required this.review,
    required this.reviewRating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        reviewerImage: json['reviewerImage'],
        reviewerName: json['reviewerName'],
        reviewDate: json['reviewDate'],
        review: json['review'],
        reviewRating: json['reviewRating'],
      );

  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) => ReviewModel(
        reviewerImage: reviewEntity.reviewerImage,
        reviewerName: reviewEntity.reviewerName,
        reviewDate: reviewEntity.reviewDate,
        review: reviewEntity.review,
        reviewRating: reviewEntity.reviewRating,
      );

  Map<String, dynamic> toJson() => {
        'reviewerImage': reviewerImage,
        'reviewerName': reviewerName,
        'reviewDate': reviewDate,
        'review': review,
        'reviewRating': reviewRating,
      };
}
