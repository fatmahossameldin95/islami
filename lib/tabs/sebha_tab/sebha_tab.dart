import 'package:flutter/material.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/widgets/tab_bg_widget.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePAth: Assets.images.sebhaScreen.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Assets.images.tabHeader.path),
                SizedBox(height: 20),
                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++;
                    });
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Image.asset(Assets.images.sebhaHead.path),
                        Image.asset(Assets.images.sebhaBody.path),
                        Center(
                          child: Text(
                            "$counter",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
