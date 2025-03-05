import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class PaypalModel {
  final String clientId;
  final String secretKey;

  PaypalModel({required this.clientId, required this.secretKey});

  factory PaypalModel.fromMap(Map<String, dynamic> map) =>
      PaypalModel(clientId: map['Client_ID'], secretKey: map['Secret_Key']);

  static Future<void> init() async {
    final configFile = await rootBundle.loadString('assets/config/main.json');
    Map<String, dynamic> configData = await jsonDecode(configFile);
    final paypalModel = PaypalModel.fromMap(configData);
    GetIt.instance.registerSingleton<PaypalModel>(paypalModel);
  }
}
