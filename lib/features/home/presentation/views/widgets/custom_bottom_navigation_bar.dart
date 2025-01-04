import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/home/presentation/model_views/bottom_navigation_bar_cubit/bottom_navigation_bar_state.dart';
import 'package:fruit_hub/features/home/presentation/model_views/bottom_navigation_bar_cubit/bottom_navigation_cubit.dart';

import '../../../data/bottom_navigation_bar_model.dart';
import 'active_bottom_bar_icon.dart';
import 'in_active_bottom_bar_icon.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return Container(
          height: 70,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x1A000000),
                offset: Offset(0, -2),
                blurRadius: 7,
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: BottomNavigationBarModel.bottomNavigationBarModel
                .asMap()
                .entries
                .map((e) {
              return InkWell(
                onTap: () {
                  context.read<BottomNavigationCubit>().changeSelectedIndex =
                      e.key;
                },
                child: BottomNavigationItem(
                    isSelected: e.key ==
                        context.read<BottomNavigationCubit>().getSelectedIndex,
                    model: e.value),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final bool isSelected;
  final BottomNavigationBarModel model;
  const BottomNavigationItem(
      {super.key, required this.isSelected, required this.model});

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveBottomBarIcon(
            iconPath: model.activeSvg,
            iconName: model.name,
          )
        : InActiveBottomBarIcon(iconPath: model.inActiveSvg);
  }
}
