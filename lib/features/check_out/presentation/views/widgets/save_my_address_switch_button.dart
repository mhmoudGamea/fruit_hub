import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/app_colors.dart';
import '../../../../../core/config/app_style.dart';
import '../../model_views/check_out_cubit.dart';

class SaveMyAddressSwitchButton extends StatelessWidget {
  const SaveMyAddressSwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final checkOutCubit = BlocProvider.of<CheckOutCubit>(context, listen: true);
    return Row(
      children: [
        Transform.scale(
          scaleY: 0.8,
          scaleX: 0.8,
          child: Switch(
            activeTrackColor: AppColors.primaryColor,
            value: checkOutCubit.isSaveAddress,
            onChanged: (value) {
              checkOutCubit.toggleIsSaveAddress();
            },
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'حفظ العنوان',
          style: AppStyle.fontsemi13.copyWith(color: const Color(0xff949D9E)),
        ),
      ],
    );
  }
}
