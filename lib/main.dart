import 'package:flutter/material.dart';
import 'package:islami/common/app_theme.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/onbording_screen.dart';
import 'package:islami/tabs/quran_tab/sura_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        OnbordingScreen.routeName: (_) => OnbordingScreen(),
      },
      theme: AppTheme.appTheme,
      home: OnbordingScreen(),
    );
  }
}
