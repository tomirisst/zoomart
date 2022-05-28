import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/product_screen/product_view_model.dart';

import '../../models/goods_model.dart';

class ProductPresenter extends BasePresenter<ProductViewModel>{
  ProductPresenter(ProductViewModel model) : super(model);



  void isProductInCart(Goods good) {
    List<dynamic> list;
    Stream docStream = FirebaseFirestore.instance
        .collection('usersCart')
        .doc(FirebaseAuth.instance.currentUser?.uid).snapshots();

  }
}
