import 'package:flutter/widgets.dart';

import '../../../../../core/config/app_style.dart';
import '../../../../../core/utilies/constants.dart';

class OtpViewBody extends StatelessWidget {
  const OtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: Column(
        children: [
          const SizedBox(height: 24),
          SizedBox(
            width: MediaQuery.of(context).size.width - (kAuthViewPadding * 2),
            child: const Text(
              'من فضلك أدخل رمز التحقق الذي تم إرساله إلى هاتفك.',
              style: AppStyle.fontsemi16,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 31),
        ],
      ),
    );
  }
}
