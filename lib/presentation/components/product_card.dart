import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/app_colors.dart';
import 'custom_button.dart';

class ProductCard extends StatefulWidget {
  final String image;
  final String title;
  final String price;
  final String description;
  final bool showDesc;
  final int quantity;


  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.showDesc,
    required this.quantity});
  @override
  ProductCardState createState() => ProductCardState(image, title, price, description,showDesc, quantity);
}
class ProductCardState extends State<ProductCard> {
  String image;
  String title;
  String price;
  String description;
  bool showDesc;
  int quantity;
  ProductCardState(this.image, this.title, this.price, this.description, this.showDesc,this.quantity);
  void increment() {
    setState(() {
      quantity++;
    });
  }

  void decrement() {
    setState(() {
      quantity = quantity == 0 ? quantity : quantity-1;
    });
  }
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
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 140,
              width: 110,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(image, fit: BoxFit.fitHeight,)),
            ),
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
                  "\$ " + price,
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
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
                    : Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Center(
                    child: Row(
                      children: [
                        ChangeAmountButton(onClicked: decrement, text: "-"),
                        Text(quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          ),),
                        ChangeAmountButton(onClicked: increment, text: "+"),
                      ],
                    ),
                  ),
                ),
                // : CustomButton(onClicked: () {}, text: "Buy"),
              ],
            ),
          ),
        ],
      ),
    );
  }

}