import 'package:flutter/material.dart';
import 'package:pomomemo/screens/SplashScreen.dart';
import 'package:pomomemo/utils/AppColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.COLOR_PINK),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
