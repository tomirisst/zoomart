import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/app_colors.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String text;

  const OnboardingPage({Key? key, required this.image, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            color: AppColors.primaryColor,
            child: SvgPicture.asset(
              "assets/images/$image.svg",
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
