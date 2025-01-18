import 'package:flutter/material.dart';
import 'package:fruit_hub/core/services/preferences.dart';
import 'package:fruit_hub/core/services/serialization_service.dart';
import 'package:fruit_hub/core/utilies/constants.dart';
import 'package:fruit_hub/core/widgets/classifying_bottom_sheet_body.dart';
import 'package:fruit_hub/features/auth/data/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:iconsax/iconsax.dart';

import '../config/app_colors.dart';
import '../config/app_style.dart';
import '../entities/review_entity.dart';
import '../model/review_model.dart';
import '../widgets/ordering_bottom_sheet_body.dart';

abstract class Helper {
  /// method used to return a [OutlineInputBorder] with a specific radius
  static InputBorder inputBorder(double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide:
          const BorderSide(color: AppColors.borderInputTextColor, width: 1),
    );
  }

  /// method used to show a success message in the bottom of the screen
  static successMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.darkPrimaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.tick_square,
                color: AppColors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message, style: AppStyle.fontsemi13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static errorMessage(BuildContext context, {required String message}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.red[400],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.warning_2,
                color: AppColors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(message, style: AppStyle.fontsemi13),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static late RegExp _regExp;

  // method for make sure that the user enter a valid email.
  static String? validateEmail(String? value) {
    _regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (value == null || value.isEmpty) {
      return 'حقل الايميل مطلوب';
    }
    if (!_regExp.hasMatch(value)) {
      return 'من فضلك أدخل ايميل صحيح';
    }
    return null;
  }

  // method for make sure that the user enter a valid password.
  static String? validatePassword(String? value) {
    _regExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%&*?])[a-zA-Z\d!@$%&*?]{8,}$');
    if (value == null || value.isEmpty) {
      return 'حقل كلمه السر مطلوب';
    }
    if (!_regExp.hasMatch(value)) {
      return '''من فضلك ادخل كلمه سر صحيحه
[حروف صغيره-حروف كبيره-ارقام-حروف خاصه
-ان لا يقل عن ثمانيه حرف]''';
    }
    return null;
  }

  /// method used to get user data from shared prefrences which is stored as encoded [Map<String, dynamic>]
  /// then i decode it to [UserEntity] object to get the user name
  /// then display it in the home screen appBar
  static UserEntity? getUserDataFromSharedPrefrences() {
    String? encodedUserData = Preferences.getValue(key: kUserData);
    Map<String, dynamic> decodedUserData;
    if (encodedUserData != null) {
      decodedUserData = SerializationService.deserialize<Map<String, dynamic>>(
          encodedUserData);
      return UserModel.fromJson(decodedUserData);
    }

    /// في حاله مثلا المستخدم سجل برقم التليفون ولم يسجل بالايميل
    return null;
  }

  static List<ReviewModel> getReviewsModelFromReviewsEntity(
      List<ReviewEntity> reviewsEntities) {
    return reviewsEntities.map((e) => ReviewModel.fromEntity(e)).toList();
  }

  static List<ReviewEntity> getReviewsEntityFromReviewsModel(
      List<ReviewModel> reviewModel) {
    return reviewModel.map((e) => ReviewModel.toEntity(e)).toList();
  }

  /// method to calc avgRating in ProductModel
  static double getAvgRating(List<ReviewEntity> reviews) {
    var sum = 0.0;
    if (reviews.isNotEmpty) {
      for (var review in reviews) {
        sum += review.reviewRating;
      }
      return sum / reviews.length;
    }
    return 0.0;
  }

  /// method to show classifying bottom sheet
  static void showClassifyingBottomModelSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 350,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color(0x1A000000),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: const ClassifyingBottomSheetBody(),
      ),
    );
  }

  /// method to show classifying bottom sheet
  static void showOrderingBottomModelSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: 300,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 20,
              spreadRadius: 0,
              color: Color(0x1A000000),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: const OrderingBottomSheetBody(),
      ),
    );
  }

  /// get header string for cart view
  static String getHeaderTitle(int length) {
    return length == 0
        ? 'السله فارغة حاليًا. أضف بعض العناصر للاستمتاع بالتسوق'
        : (length == 1
            ? 'لديك منتج واحد في سله التسوق'
            : (length == 2
                ? 'لديك منتجان في سله التسوق'
                : 'لديك $length منتجات في سله التسوق'));
  }

  // method to extract last 4 number from card number
  static String formatNumber(String number) {
    if (number.length < 4) return number;
    String lastFourDigits = number.substring(number.length - 4);
    String formattedNumber = '**** **** **** $lastFourDigits';
    return formattedNumber;
  }
}
