import 'package:flutter/material.dart';
import 'package:tick_watch/pages/splash_page.dart';
import 'package:tick_watch/util/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TickWatch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().appTheme(),
      home: const SplashPage(),
    );
  }
}
