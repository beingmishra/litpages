import 'package:flutter/material.dart';
import 'package:litpages/config/theme/app_theme.dart';
import 'package:litpages/features/home/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.themeData,
      home: const HomeScreen(),
    );
  }
}
