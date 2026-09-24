import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/widgets/tab_bg_widget.dart';

class HadeethTab extends StatelessWidget {
  const HadeethTab({super.key});

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: LayoutBuilder(
                  builder: (context, BoxConstraints constraints) {
                    return CarouselSlider.builder(
                      itemCount: 20,
                      options: CarouselOptions(
                        height: constraints.maxHeight,
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      itemBuilder: (context, index, realIndex) => Card(
                        color: AppColors.goldColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(Assets.images.hadeethItemBg.path, fit: BoxFit.fill),
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
                                      "title",
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Text(
                                          """
Deleo assumenda condico amet ascisco pecco facilis. Tergeo curatio exercitationem vilis aperte calculus coniecto. Averto aut cernuus cavus cohors dedico bis tubineus adsum.
Confido corrupti veritatis considero theologus amet distinctio. Caries blanditiis totidem tamisium somniculosus clam angustus amo. Claudeo cimentarius celer antepono abduco amissio tui video cometes.Deleo assumenda condico amet ascisco pecco facilis. Tergeo curatio exercitationem vilis aperte calculus coniecto. Averto aut cernuus cavus cohors dedico bis tubineus adsum.
Confido corrupti veritatis considero theologus amet distinctio. Caries blanditiis totidem tamisium somniculosus clam angustus amo. Claudeo cimentarius celer antepono abduco amissio tui video cometes.Deleo assumenda condico amet ascisco pecco facilis. Tergeo curatio exercitationem vilis aperte calculus coniecto. Averto aut cernuus cavus cohors dedico bis tubineus adsum.
Confido corrupti veritatis considero theologus amet distinctio. Caries blanditiis totidem tamisium somniculosus clam angustus amo. Claudeo cimentarius celer antepono abduco amissio tui video cometes.Deleo assumenda condico amet ascisco pecco facilis. Tergeo curatio exercitationem vilis aperte calculus coniecto. Averto aut cernuus cavus cohors dedico bis tubineus adsum.
Confido corrupti veritatis considero theologus amet distinctio. Caries blanditiis totidem tamisium somniculosus clam angustus amo. Claudeo cimentarius celer antepono abduco amissio tui video cometes.Deleo assumenda condico amet ascisco pecco facilis. Tergeo curatio exercitationem vilis aperte calculus coniecto. Averto aut cernuus cavus cohors dedico bis tubineus adsum.
Confido corrupti veritatis considero theologus amet distinctio. Caries blanditiis totidem tamisium somniculosus clam angustus amo. Claudeo cimentarius celer antepono abduco amissio tui video cometes.Deleo assumenda condico amet ascisco pecco facilis. Tergeo curatio exercitationem vilis aperte calculus coniecto. Averto aut cernuus cavus cohors dedico bis tubineus adsum.
Confido corrupti veritatis considero theologus amet distinctio. Caries blanditiis totidem tamisium somniculosus clam angustus amo. Claudeo cimentarius celer antepono abduco amissio tui video cometes.""",
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
              // Expanded(
              //   child: PageView.builder(
              //     controller: PageController(viewportFraction: 300 / 430, initialPage: 3),
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 20,
              //     itemBuilder: (context, index) {
              //       return     },
              //   ),
              // ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
