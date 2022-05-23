import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/product_card.dart';
import 'package:zoomart/presentation/screens/like_screen/like_presenter.dart';
import 'package:zoomart/presentation/screens/like_screen/like_view_model.dart';

import '../../base/base_screen_state.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  final LikePresenter _presenter = LikePresenter(LikeViewModel(ScreenState.none));

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Liked by you",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: _presenter.products.length,
              itemBuilder: (context, index) {
                return ProductCard(
                  image: _presenter.products[index].image,
                  title: _presenter.products[index].title,
                  price: _presenter.products[index].price,
                  description: _presenter.products[index].description,
                  showDesc: false,
                  isLiked: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
