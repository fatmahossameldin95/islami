import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/widgets/tab_bg_widget.dart';

class TimesTab extends StatelessWidget {
  const TimesTab({super.key});

  final List<String> azkar = const [
    "Morning Azkar",
    "Evening Azkar",
    "Waking Azkar",
    "Sleeping Azkar",
  ];
  final List<String> azkarImages = const [
    "assets/images/morning_azkar.png",
    "assets/images/evening_azkar.png",
    "assets/images/waking_azkar.png",
    "assets/images/sleeping_azkar.png",
  ];
  final List<String> prayer = const ["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"];
  final List<String> prayerTimes = const [
    "05:00 \n AM",
    "01:01 \n PM",
    "04:38 \n PM",
    "07:57 \n PM",
    "09:57 \n PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePAth: Assets.images.timesScreen.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Image.asset(Assets.images.tabHeader.path),
                SizedBox(height: 20),
                prayerTimeCard(),

                const SizedBox(height: 20),

                Text(
                  'Azkar',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 250,
                        ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.blackColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: const BorderSide(
                            color: AppColors.goldColor,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(azkarImages[index], fit: BoxFit.cover),
                            SizedBox(height: 8),
                            Text(
                              azkar[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget prayerTimeCard() {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        image: const DecorationImage(
          image: AssetImage("assets/images/prayer_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        spacing: 10,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "16 Jul,",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "2024",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Column(
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      "Pray Time",
                      style: TextStyle(
                        color: AppColors.brownColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text(
                      "Tuesday",
                      style: TextStyle(
                        color: AppColors.brownColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "09 Muh.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "1446",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return CarouselSlider.builder(
                  itemCount: 5,
                  options: CarouselOptions(
                    height: constraints.minHeight,
                    viewportFraction: 0.33,
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (context, index, realIndex) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/pray_time.png"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          prayer[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          prayerTimes[index].split('\n')[0],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          prayerTimes[index].split('\n')[1],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Next Pray - ',
                style: TextStyle(
                  color: AppColors.brownColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '2:32',
                style: TextStyle(
                  color: AppColors.brownColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.volume_mute_rounded, size: 40),
            ],
          ),
        ],
      ),
    );
  }
}
