import 'package:flutter/material.dart';

class InActiveDot extends StatelessWidget {
  const InActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xff949D9E),
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
