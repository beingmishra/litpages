import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:litpages/config/theme/app_theme.dart';
import 'package:litpages/core/helpers/bloc_generator.dart';
import 'package:litpages/features/home/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocGenerator.generateBloc(),
      child: MaterialApp(
        theme: AppTheme.themeData,
        home: const HomeScreen(),
      ),
    );
  }
}
