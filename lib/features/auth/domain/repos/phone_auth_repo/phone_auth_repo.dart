import 'package:flutter/material.dart';

abstract class PhoneAuthRepo {
  Future<void> verifyPhoneNumber(BuildContext context, String phoneNumber);
}
