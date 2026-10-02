import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/models/hadeeth_model.dart';
import 'package:islami/widgets/tab_bg_widget.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

final List<HadeethModel> ahadeeth = [];
bool isLoading = true;

class _HadeethTabState extends State<HadeethTab> {
  @override
  Widget build(BuildContext context) {
    if (ahadeeth.isEmpty) loadHadeethContent();
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePAth: Assets.images.hadeethBg.path),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(Assets.images.tabHeader.path)),
              SizedBox(height: 35),
              if (isLoading)
                CircularProgressIndicator()
              else
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                      return CarouselSlider.builder(
                        itemCount: ahadeeth.length,
                        options: CarouselOptions(
                          height: constraints.maxHeight,
                          autoPlay: true,
                          enlargeCenterPage: true,
                        ),
                        itemBuilder: (context, index, realIndex) => Card(
                          color: AppColors.goldColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                  Assets.images.hadeethItemBg.path,
                                  fit: BoxFit.fill,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 20,
                                    bottom: 60,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    spacing: 10,
                                    children: [
                                      Text(
                                        ahadeeth[index].hadeethName ?? "",
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.center,
                                            ahadeeth[index].hadeethContent?.join("\n") ??
                                                "",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.blackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> loadHadeethContent() async {
    for (int i = 1; i <= 50; i++) {
      String hadeeth = await rootBundle.loadString('assets/hadeeth/h$i.txt');
      hadeeth = hadeeth.trim();
      List<String> splitHadeeth = hadeeth.split('\n');
      ahadeeth.add(
        HadeethModel(
          hadeethName: splitHadeeth[0],
          hadeethContent: splitHadeeth.sublist(1),
        ),
      );
    }

    setState(() {
      isLoading = false;
    });
  }
}
