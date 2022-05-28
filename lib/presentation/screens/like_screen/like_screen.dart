import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/product_card.dart';
import 'package:zoomart/presentation/screens/like_screen/like_presenter.dart';
import 'package:zoomart/presentation/screens/like_screen/like_view_model.dart';

import '../../base/base_screen_state.dart';
import '../../components/custom_button.dart';
import '../../models/goods_model.dart';
import '../delivery_screen/delivery_screen.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  final LikePresenter _presenter =
      LikePresenter(LikeViewModel(ScreenState.none));
  List<Goods> goods = [];
  var docSnapshot = FirebaseFirestore.instance.collection('usersCart').doc(FirebaseAuth.instance.currentUser?.uid).get();
  var document3 = FirebaseFirestore.instance.collection('usersCart').doc(FirebaseAuth.instance.currentUser?.uid);

  Future<void> getGoods() async {
    goods = await _presenter.products;
    setState(() {});
    return;
  }

  @override
  void initState() {
    setState(() {
      getGoods();
    });
    super.initState();
  }

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
          "Cart",
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
            child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('usersCart').doc(FirebaseAuth.instance.currentUser?.uid).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var userDocument = snapshot.data!.data();
                  var id = userDocument!["id"];
                  print("The id is:");
                  print(userDocument["id"]);
                  var good = goods[id - 1];
                      return Column(
                        children: [
                          ProductCard(
                            // image: document['photo'],
                            // title: document['name'],
                            // price: document['price'],
                            // description: document['description'],
                            image: good.photo!,
                            title: good.name!,
                            price: good.price!,
                            description: good.description!,
                            showDesc: false,
                            quantity: 1,
                          ),
                        ],
                      );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onClicked: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeliveryScreen(),),
                      );
                    },
                    text: "Buy",
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
