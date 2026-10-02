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
final List<String> tasbeeh = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ لِلَّهِ",
    "اللَّهُ أَكْبَرُ",
  ];
  int currentIndex = 0;
  double rotationAngle = 0.0;
  static const int tasbeehCount = 33;
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
                SizedBox(height: 20),
                Image.asset(Assets.images.sebhaHead.path),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      counter++;
                      rotationAngle += (1/tasbeehCount);
                      if (counter > tasbeehCount) {
                        counter = 0;
                        currentIndex = (currentIndex + 1) % tasbeeh.length;
                      }
                    });
                  },
                  child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: rotationAngle,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child:
                        Image.asset(Assets.images.sebhaBody.path)),
                         Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        Text(
                            tasbeeh[currentIndex],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           SizedBox(height: 20),
                        Text(
                            "$counter",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ])
                      ],
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
