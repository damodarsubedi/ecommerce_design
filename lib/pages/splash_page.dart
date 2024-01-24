import 'package:flutter/material.dart';
import 'package:tick_watch/util/app_navbar.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  double opacity = 0;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppNavBar(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              onEnd: () {
                setState(() {
                  opacity = 1;
                });
              },
              curve: Curves.easeInCirc,
              tween: Tween<double>(begin: 10, end: 270),
              duration: const Duration(seconds: 2),
              builder: (context, value, child) {
                return Image.asset(
                  "assets/images/tick_watch.png",
                  height: value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
