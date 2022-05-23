import 'package:flutter/material.dart';
import 'package:zoomart/constants/app_colors.dart';
import 'package:zoomart/presentation/screens/bone_screen/bone_screen.dart';
import 'package:zoomart/presentation/screens/like_screen/like_screen.dart';
import 'package:zoomart/presentation/screens/navigation/widgets/navigation_bar_items.dart';
import 'package:zoomart/presentation/screens/profile_screen/profile_screen.dart';
import 'package:zoomart/presentation/screens/zoo_screen/zoo_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {

  int selectedPageIndex = 0;
  final List<Widget> _pages = [
    ZooScreen(),
    BoneScreen(),
    LikeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: _pages,
        index: selectedPageIndex,
      ),
      bottomNavigationBar: Container(
        color: AppColors.background,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 10,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.background,
                type: BottomNavigationBarType.fixed,
                iconSize: 24,
                currentIndex: selectedPageIndex,
                elevation: 10,
                onTap: (int index) {
                  setState(() {
                    selectedPageIndex = index;
                  });
                },
                items: bottomNavigationBarItems(selectedPageIndex),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
