import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoomart/presentation/screens/orders_screen/widget/order_card.dart';

import '../../../constants/app_colors.dart';
import '../../base/base_screen_state.dart';
import 'orders_presenter.dart';
import 'orders_view_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final OrderPresenter _presenter = OrderPresenter(OrderViewModel(ScreenState.none));

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
          "Orders",
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
              flex: 8,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('usersCart')
                    .doc(FirebaseAuth.instance.currentUser?.uid).snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<dynamic>? orders = snapshot.data!.data()?["orders"];
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: orders?.length,
                    itemBuilder: (context, index) {
                      return  OrderCard(
                        orderNumber: orders?[index]["key"],
                        total: orders?[index]["totalPrice"],
                        status: orders?[index]["status"],
                      );
                    },
                  );
                }
              ),
            ),
      ]),
    );
  }
}
