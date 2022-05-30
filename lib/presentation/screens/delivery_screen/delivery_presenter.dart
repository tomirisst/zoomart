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
  CollectionReference usersCart = FirebaseFirestore.instance.collection('usersCart');
  var documnetId = FirebaseAuth.instance.currentUser?.uid;
  await usersCart.doc(documnetId).set({
    'ids': [],
  });
}