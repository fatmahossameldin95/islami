import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/tabs/quran_tab/views/most_recent_view.dart';
import 'package:islami/tabs/quran_tab/views/suras_list_view.dart';
import 'package:islami/widgets/tab_bg_widget.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = '';
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TabBgWidget(imagePAth: Assets.images.quranTabBgImage.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.asset(Assets.images.tabHeader.path)),
                SizedBox(height: 20),
                TextField(
                  style: TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.blackColor.withValues(alpha: .7),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(
                        Assets.images.quranIcon,

                        colorFilter: ColorFilter.mode(AppColors.goldColor, BlendMode.srcIn),
                      ),
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.goldColor),
                    ),
                    hintText: "Sura name",

                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                      borderSide: BorderSide(color: AppColors.goldColor),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MostRecentView(),
                SizedBox(height: 20),
                SurasListView(searchText: searchText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
void addToMostRecent(int index){
  
}