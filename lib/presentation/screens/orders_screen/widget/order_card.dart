import 'package:flutter/material.dart';

import '../../../../constants/app_colors.dart';

class OrderCard extends StatelessWidget {
  final int orderNumber;
  final int total;
  final String status;

  const OrderCard({
    Key? key,
    required this.orderNumber,
    required this.status,
    required this.total,
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
      child:
          Padding(
            padding: const EdgeInsets.all(15),
            child: Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order number: " + orderNumber.toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.wallet_outlined,
                            color: AppColors.black,
                          ),
                          Text(
                            "total : \$" + total.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Status: " + status,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: status!="Completed" ? Colors.lightGreen : Colors.blueGrey
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            ),
    );
  }
}
