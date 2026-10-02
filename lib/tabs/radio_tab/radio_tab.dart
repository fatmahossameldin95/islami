import 'package:flutter/material.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/widgets/radio_card.dart';
import 'package:islami/widgets/tab_bg_widget.dart';
import 'package:islami/common/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});
  final List<String> radios = const [
    "Radio Ibrahim Al-Akdar",
    "Radio Al-Qaria Yassen",
    "Radio Ahmed Al-trabulsi",
    "Radio Addokali Mohammad Alalim",
  ];

  final List<String> reciters = const [
    "Ibrahim Al-Akdar",
    "Akram Alalaqi",
    "Majed Al-Enezi",
    "Malik shaibat Alahamed",
  ];

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
                
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.blackColor.withAlpha(50),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TabBar(
                            indicator: BoxDecoration(
                              color: AppColors.goldColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,

                            labelColor: AppColors.blackColor,
                            unselectedLabelColor: Colors.white,

                            labelStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            tabs: [
                              Tab(text: "Radio"),
                              Tab(text: "Reciters"),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TabBarView(
                              children: [
                                radioTabContent(radios),
                                radioTabContent(reciters),
                              ],
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

  Widget radioTabContent(List<String> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return RadioCard(name: items[index]);
      },
    );
  }

 
}
