import 'package:flutter/material.dart';
import 'package:fruit_hub/core/config/app_colors.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues rangeValues = const RangeValues(10, 500);
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: const SliderThemeData(
        activeTickMarkColor: Colors.transparent,
        inactiveTickMarkColor: Colors.transparent,
        activeTrackColor: AppColors.primaryColor,
        inactiveTrackColor: AppColors.backgroundItemColor,
        thumbColor: AppColors.primaryColor,
        rangeThumbShape: RoundRangeSliderThumbShape(enabledThumbRadius: 8),
        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(color: Colors.white),
        showValueIndicator: ShowValueIndicator.always,
      ),
      child: RangeSlider(
        values: rangeValues,
        min: 0,
        max: 500,
        divisions: 10,
        onChanged: (value) {
          setState(() {
            rangeValues = value;
          });
        },
      ),
    );
  }
}
