import 'package:flutter/cupertino.dart';
import 'package:zoomart/presentation/screens/login_screen/login_screen.dart';
import 'package:zoomart/presentation/screens/signup_screen/signup_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);


  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(onClickedSignUp: toggle)
      : SignUpScreen(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);

}
