import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_style.dart';

import 'address_confirmation.dart';
import 'order_confirmation.dart';
import 'order_summery.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ملخص الطلب :', style: AppStyle.fontbold13),
          SizedBox(height: 8),
          OrderSummery(),
          SizedBox(height: 16),
          Text('يرجي تأكيد  طلبك', style: AppStyle.fontbold13),
          SizedBox(height: 8),
          OrderConfirmation(),
          SizedBox(height: 16),
          Text('يرجي تأكيد  عنوانك', style: AppStyle.fontbold13),
          SizedBox(height: 8),
          AddressConfirmation(),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
