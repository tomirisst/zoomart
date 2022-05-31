import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'delivery_view_model.dart';

class DeliveryPresenter extends BasePresenter<DeliveryViewModel>{
  DeliveryPresenter(DeliveryViewModel model) : super(model);

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

}

void clearCartData() async {
  // CollectionReference usersCart = FirebaseFirestore.instance.collection('usersCart');
  // var documnetId = FirebaseAuth.instance.currentUser?.uid;
  // await usersCart.doc(documnetId).set({
  //   'ids': [],
  // });

  FirebaseFirestore.instance
      .collection('usersCart')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .update({
    'ids': []
  });
  //
  // var document3 = await FirebaseFirestore.instance
  //     .collection('usersCart')
  //     .doc(FirebaseAuth.instance.currentUser?.uid).get();
  // List<dynamic>? data = document3.data()?["orders"];
  // print(data?[0]["phoneNumber"]);
}