import 'package:flutter/material.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';

class MostRecentView extends StatelessWidget {
  const MostRecentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: AppColors.goldColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text(
                          "Sura Name",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sura name2",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Sura name3",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(Assets.images.suraImage.path, width: 150, fit: BoxFit.cover),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
