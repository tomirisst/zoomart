import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import 'custom_button.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final bool showDesc;
  final bool isLiked;

  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.isLiked,
    required this.showDesc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.3),
              blurRadius: 20,
              spreadRadius: 3,
              offset: const Offset(10, 10))
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(image),
          ),
          const SizedBox(
            width: 15,
          ),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  "\$" + price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                showDesc
                    ? Row(
                      children: [
                        Flexible(
                          child: Text(
                            description,
                            overflow: TextOverflow.fade,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    )
                    : CustomButton(onClicked: () {}, text: "Buy"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 25,
              width: 25,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.background,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: const Offset(7, 7))
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  isLiked ? "assets/icons/ic_heart.svg" : "assets/icons/ic_heart_not_filled.svg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
