import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/screens/login_screen/login_view_model.dart';

class LoginPresenter extends BasePresenter<LoginViewModel>{
  LoginPresenter(LoginViewModel model) : super(model);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

}