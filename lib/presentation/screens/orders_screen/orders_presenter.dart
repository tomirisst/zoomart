import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/orders_screen/orders_view_model.dart';

class OrderPresenter extends BasePresenter<OrderViewModel>{
  OrderPresenter(OrderViewModel model) : super(model);
  List<dynamic> orders = [
    Order(
        orderNumber: 12345,
        total: 1900,
        status: "Delivery in 2 days"
    ),
    Order(
        orderNumber: 11235,
        total: 2560,
        status: "Completed"
    ),
    Order(
        orderNumber: 11248,
        total: 65236,
        status: "Completed"
    ),
    Order(
        orderNumber: 89665,
        total: 5620,
        status: "Completed"
    ),
  ];
}

void getCartIds() async {
  var document3 = await FirebaseFirestore.instance
      .collection('usersCart')
      .doc(FirebaseAuth.instance.currentUser?.uid).get();
  List<dynamic>? data = document3.data()?["ids"];
  // print(data?["orders"][0]["phoneNumber"]);
  print(data?.length);
}