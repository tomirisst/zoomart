import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../constants/app_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  LoadingScreenState createState() => LoadingScreenState();

}

class LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SpinKitCircle(
          size: 140,
          // duration: const Duration(seconds: 2),
          itemBuilder: (context, index) {
            final colors = [AppColors.lightColor, AppColors.darkColor];
            final color = colors[index % colors.length];
            return DecoratedBox(
                decoration: BoxDecoration(
                    color: color,
                  shape: BoxShape.circle
                )
            );
          }
        ),
      ),
    );
  }
}