import 'package:flutter/material.dart';
import 'package:fruit_hub/core/services/preferences.dart';
import 'package:fruit_hub/core/services/serialization_service.dart';
import 'package:fruit_hub/core/utilies/constants.dart';
import 'package:fruit_hub/features/auth/data/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:iconsax/iconsax.dart';

import '../config/app_colors.dart';
import '../config/app_style.dart';

abstract class Helper {
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
  static UserEntity getUserDataFromSharedPrefrences() {
    String encodedUserData = Preferences.getValue(key: kUserData);
    Map<String, dynamic> decodedUserData =
        SerializationService.deserialize<Map<String, dynamic>>(encodedUserData);
    return UserModel.fromJson(decodedUserData);
  }
}
