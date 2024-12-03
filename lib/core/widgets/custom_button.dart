import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String data;
  const CustomButton({super.key, required this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        data,
        style: const TextStyle(color: AppColors.white),
      ),
    );
  }
}
