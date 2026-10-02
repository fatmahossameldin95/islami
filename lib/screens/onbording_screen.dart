import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/data/onbording_data.dart';
import 'package:islami/gen/assets.gen.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});
  static const String routeName = '/onbordingScreen';

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController pgController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(Assets.images.tabHeader.path)),
              SizedBox(height: 20),
              Expanded(
                child: PageView.builder(
                  controller: pgController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Expanded(
                            child: Image.asset(
                              pages[index]["image"]!,
                              fit: BoxFit.contain,
                            ),
                          ),

                          const SizedBox(height: 20),
                          Text(
                            pages[index]["title"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.goldColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Description
                          Text(
                            pages[index]["description"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppColors.goldColor,
                              fontSize: 14,
                            ),
                          ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentPage == 0
                          ? null
                          : () {
                              pgController.previousPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: AppColors.goldColor),
                      ),
                    ),
                    Row(
                      children: List.generate(
                        pages.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: currentPage == index ? 12 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? AppColors.goldColor
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentPage < pages.length - 1) {
                          pgController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, '/homeScreen');
                        }
                      },
                      child: Text(
                        currentPage == pages.length - 1 ? "Finish" : "Next",
                        style: const TextStyle(color: AppColors.goldColor),
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
  }
}
