import 'package:flutter/material.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/widgets/tab_bg_widget.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePAth: Assets.images.radioScreen.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.images.tabHeader.path),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
