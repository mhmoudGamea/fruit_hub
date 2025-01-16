import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/check_out_button.dart';

import '../../../../../core/utilies/constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../model_views/check_out_cubit.dart';
import 'check_out_pages.dart';
import 'check_out_steps.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kAuthViewPadding),
      child: Column(
        children: [
          SizedBox(height: 20),
          // steps
          CheckOutSteps(),
          SizedBox(height: 32),
          // page view
          CheckOutPages(),
          // button
          CheckOutButton(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
