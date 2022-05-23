import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class ProfileCard extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const ProfileCard({Key? key, required this.onTap, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow:  [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 2,

            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
