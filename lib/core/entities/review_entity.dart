class ReviewEntity {
  final String reviewerImage;
  final String reviewerName;
  final String reviewDate;
  final String review;
  final num reviewRating;

  ReviewEntity({
    required this.reviewerImage,
    required this.reviewerName,
    required this.reviewDate,
    required this.review,
    required this.reviewRating,
  });
}
