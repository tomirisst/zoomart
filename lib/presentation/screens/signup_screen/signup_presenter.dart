import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/login_screen/login_view_model.dart';
import 'package:zoomart/presentation/screens/signup_screen/signup_view_model.dart';
import 'package:zoomart/presentation/screens/signup_screen/utils.dart';


class SignUpPresenter extends BasePresenter<SignUpViewModel> {
  SignUpPresenter(SignUpViewModel model) : super(model);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signUp(GlobalKey<FormState> key) async {
    final isValid = key.currentState!.validate();
    if(!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      CollectionReference usersCart = FirebaseFirestore.instance.collection('usersCart');
      var documnetId = FirebaseAuth.instance.currentUser?.uid;
      await usersCart.doc(documnetId).set({
        'ids': [],
        'uid': documnetId,
      });
      // usersCart.add({
      //   'id': 2,
      //   'uid': FirebaseAuth.instance.currentUser?.uid,
      // }).then((value) => print('Document added'));
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

  }
}
