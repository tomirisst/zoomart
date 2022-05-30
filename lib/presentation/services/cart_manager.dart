import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:zoomart/presentation/components/product_card.dart';

import '../models/goods_model.dart';
import '../screens/bone_screen/bone_view_model.dart';

class CartManager extends GetxController {
  static CartManager instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;
}

void addProductToCart(Goods product) {
  FirebaseFirestore.instance
      .collection('usersCart')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .update({
    'ids': FieldValue.arrayUnion([product.id])
  });
}

void addOrderToOrders(String address, String phoneNumber, String status,
    double totalPrice) {
  FirebaseFirestore.instance
      .collection('usersCart')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .update({
    'orders': [{
      "address": address,
      "key": 12346,
      "phoneNumber": phoneNumber,
      "status": status,
      "totalPrice": totalPrice
    }]
  });

}