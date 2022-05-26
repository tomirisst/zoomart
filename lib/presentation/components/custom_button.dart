import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class CustomButton extends StatelessWidget {
  final void Function() onClicked;
  final String text;
  const CustomButton({Key? key, required this.onClicked, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.primaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 5,
              offset: const Offset(3,3),
            )
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
class ChangeAmountButton extends StatelessWidget {
  final void Function() onClicked;
  final String text;
  const ChangeAmountButton({Key? key, required this.onClicked, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColors.background,
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
