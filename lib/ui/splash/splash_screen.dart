import 'package:flutter/material.dart';
import 'package:pokeprovider_app/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _loadApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/pokeball.png',
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Future<void> _loadApp() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomeScreen.init()),
      );
    }
  }
}
