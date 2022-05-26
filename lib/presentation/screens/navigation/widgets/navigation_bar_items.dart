import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoomart/constants/app_colors.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems(index) {
  return [
    BottomNavigationBarItem(
      icon: Neumorphic(
        padding: const EdgeInsets.all(16),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          depth: index == 0 ? -5 : 5,
          color: AppColors.background,
        ),
        child: SvgPicture.asset(
          'assets/icons/ic_home.svg',
          color: index == 0 ? AppColors.primaryColor : AppColors.black.withOpacity(0.5),
        ),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Neumorphic(
        padding: const EdgeInsets.all(16),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          depth: index == 1 ? -5 : 5,
          color: AppColors.background,
        ),
        child: SvgPicture.asset(
          'assets/icons/ic_bone.svg',
          color: index == 1 ? AppColors.primaryColor : AppColors.black.withOpacity(0.5),
        ),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Neumorphic(
        padding: const EdgeInsets.all(16),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          depth: index == 2 ? -5 : 5,
          color: AppColors.background,
        ),
        child: Image.asset(
          'assets/icons/ic_cart.png',
          width: 30,
          height: 30,
          color: index == 2 ? AppColors.primaryColor : AppColors.black.withOpacity(0.5),
        ),
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Neumorphic(
        padding: const EdgeInsets.all(16),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(),
          depth: index == 3 ? -5 : 5,
          color: AppColors.background,
        ),
        child: SvgPicture.asset(
          'assets/icons/ic_user.svg',
          color: index == 3 ? AppColors.primaryColor : AppColors.black.withOpacity(0.5),
        ),
      ),
      label: '',
    ),
  ];
}
