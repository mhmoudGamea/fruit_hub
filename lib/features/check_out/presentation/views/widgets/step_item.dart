import 'package:flutter/material.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/active_step_item.dart';
import 'package:fruit_hub/features/check_out/presentation/views/widgets/in_active_step_item.dart';

class StepItem extends StatelessWidget {
  final String title;
  final int index;
  final bool isActive;
  const StepItem({
    super.key,
    required this.title,
    required this.index,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: ActiveStepItem(title: title),
      secondChild: InActiveStepItem(stepNumber: index, title: title),
      crossFadeState:
          isActive ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: const Duration(microseconds: 600),
    );
  }
}
