import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/custom_button.dart';
import 'package:zoomart/presentation/screens/login_screen/login_presenter.dart';
import 'package:zoomart/presentation/screens/login_screen/login_view_model.dart';
import 'package:zoomart/presentation/screens/navigation/navigation_screen.dart';
import 'package:zoomart/presentation/screens/profile_screen/profile_screen.dart';

import '../../base/base_screen_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  final LoginPresenter _presenter = LoginPresenter(LoginViewModel(ScreenState.none));

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  void dispose(){
    _presenter.emailController.dispose();
    _presenter.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigationScreen();
          } else {
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primaryColor,
                    AppColors.white,
                  ],
                ),
              ),
              child: SafeArea(
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 48,
                          ),
                          SvgPicture.asset("assets/images/logo.svg"),
                          const Text(
                            "Zoomart",
                            style: TextStyle(
                              fontSize: 48,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 24),
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            topLeft: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.mail_outline_rounded,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Email",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              controller: _presenter.emailController,
                              cursorColor: AppColors.primaryColor,
                              obscureText: false,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.key,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            TextField(
                              controller: _presenter.passwordController,
                              cursorColor: AppColors.primaryColor,
                              obscureText: true,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                            CustomButton(
                              onClicked: () {
                                _presenter.signIn();
                              },
                              text: "Log In",
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Create account",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }
      ),
    );
  }
}
