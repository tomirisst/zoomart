import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/custom_button.dart';
import 'package:zoomart/presentation/screens/product_screen/product_presenter.dart';
import 'package:zoomart/presentation/screens/product_screen/product_view_model.dart';
import 'package:zoomart/presentation/services/cart_manager.dart';

import '../../base/base_screen_state.dart';
import '../bone_screen/bone_view_model.dart';

class ProductScreen extends StatefulWidget {
  final Goods good;

  const ProductScreen({Key? key, required this.good}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final ProductPresenter _presenter =
  ProductPresenter(ProductViewModel(ScreenState.none));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: AppColors.primaryColor,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 200,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  widget.good.photo!,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.good.name!,
                      style: const TextStyle(
                        fontSize: 24,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "\$" + widget.good.price!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            widget.good.description!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        onClicked: () {
                          _presenter.isProductInCart(widget.good);
                          if (!widget.good.isInCart!) {
                            widget.good.isInCart = !widget.good.isInCart!;
                            const snackBar =
                                SnackBar(content: Text('Added to Cart'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            addProductToCart(widget.good);
                          } else {
                            const snackBar =
                                SnackBar(content: Text('Already in Cart'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        text: "Add to cart"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
