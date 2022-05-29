import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/screens/payment_screen/payment_screen.dart';
import 'package:zoomart/presentation/screens/profile_screen/profile_presenter.dart';
import 'package:zoomart/presentation/screens/profile_screen/profile_view_model.dart';
import 'package:zoomart/presentation/screens/profile_screen/widgets/profile_card.dart';

import '../../base/base_screen_state.dart';
import '../auth_screen/auth_screen.dart';
import '../edit_screen/edit_screen.dart';
import '../orders_screen/orders_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfilePresenter _presenter =
      ProfilePresenter(ProfileViewModel(ScreenState.none));

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    margin: const EdgeInsets.only(
                        left: 24, right: 24, top: 70, bottom: 12),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Tomiris Zhailanova",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on_outlined),
                            Text(
                              "Expo, Astana IT University",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.primaryColor,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          "https://m.media-amazon.com/images/I/41AKvnBNqoL.jpg"),
                    ),
                  )
                ],
              ),
              ProfileCard(onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => EditScreen()));
              }, text: "Edit Profile"),
              ProfileCard(onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PaymentScreen()));
              }, text: "Payment Details"),
              ProfileCard(onTap: () {
                  Navigator.push(
                  context, MaterialPageRoute(builder: (context) => OrderScreen()));
              }, text: "Orders"),
              ProfileCard(onTap: () {}, text: "Politics & Docs"),
              ProfileCard(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const AuthScreen()));
                    FirebaseAuth.instance.signOut();},
                  text: "Log Out"),
            ],
          ),
        ),
      ),
    );
  }
}
