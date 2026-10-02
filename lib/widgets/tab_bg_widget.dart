import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';

class TabBgWidget extends StatelessWidget {
  const TabBgWidget({super.key, required this.imagePAth});
  final String imagePAth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(imagePAth, fit: BoxFit.cover),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.blackColor.withValues(alpha: 0.7), AppColors.blackColor],
            ),
          ),
        ),
      ],
    );
  }
}
