import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/components/custom_button.dart';
import 'package:zoomart/presentation/screens/login_screen/login_screen.dart';
import 'package:zoomart/presentation/screens/onboarding_screen/widgets/page.dart';

import '../../base/base_screen_state.dart';
import 'onboarding_presenter.dart';
import 'onboarding_view_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingPresenter _presenter = OnboardingPresenter(OnboardingViewModel(ScreenState.none));

  @override
  void didChangeDependencies() {
    _presenter.initWithContext(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _presenter.pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _presenter.currentPage = page;
                  });
                },
                children: const [
                  OnboardingPage(
                    image: "boarding_1",
                    title: "Zoomart",
                    text: "App where you can adopt new member of family and buy sweets for them",
                  ),
                  OnboardingPage(
                    image: "boarding_1",
                    title: "Zoomart",
                    text: "App where you can adopt new member of family and buy sweets for them",
                  ),
                  OnboardingPage(
                    image: "boarding_1",
                    title: "Zoomart",
                    text: "App where you can adopt new member of family and buy sweets for them",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _presenter.buildPageIndicator(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onClicked: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      },
                      text: "Let's Go",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
