import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/base/base_presenter.dart';
import 'package:zoomart/presentation/base/base_view_model.dart';
import 'package:zoomart/presentation/screens/onboarding_screen/onboarding_view_model.dart';

class OnboardingPresenter extends BasePresenter<OnboardingViewModel>{

  final int numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  OnboardingPresenter(OnboardingViewModel model) : super(model);

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: 4,
      width: isActive ? 24 : 4,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.primaryColor.withOpacity(0.5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

}