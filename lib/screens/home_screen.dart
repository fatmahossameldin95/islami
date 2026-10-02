import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/common/app_colors.dart';
import 'package:islami/gen/assets.gen.dart';
import 'package:islami/tabs/hadeeth_tab/hadeeth_tab.dart';
import 'package:islami/tabs/quran_tab/quran_tab.dart';
import 'package:islami/tabs/radio_tab/radio_tab.dart';
import 'package:islami/tabs/sebha_tab/sebha_tab.dart';
import 'package:islami/tabs/times_tab/times_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/homeScreen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTab(), HadeethTab(), SebhaTab(), RadioTab(), TimesTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.goldColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedItemColor: AppColors.blackColor,
        selectedItemColor: Colors.white,
        items: [
          _buildBottomNavItem(icon: Assets.images.quranIcon, label: "Quran"),
          _buildBottomNavItem(icon: (Assets.images.hadeethIcon), label: "Hadeeth"),
          _buildBottomNavItem(icon: (Assets.images.sebhaIcon), label: "Sebha"),
          _buildBottomNavItem(icon: (Assets.images.radioIcon), label: "Radio"),
          _buildBottomNavItem(icon: (Assets.images.timesIcon), label: "Times"),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({required String icon, required String label}) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        width: 26,
        height: 26,
        colorFilter: ColorFilter.mode(AppColors.blackColor, BlendMode.srcIn),
      ),
      activeIcon: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.blackColor.withValues(alpha: .6),
          borderRadius: BorderRadius.circular(66),
        ),
        child: SvgPicture.asset(
          icon,
          // color: Colors.red,
          width: 20,
          height: 20,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      label: label,
    );
  }
}
