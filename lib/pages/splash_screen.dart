import 'package:flutter/material.dart';
import 'package:hallotaxv2/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    try {
      _navigateToHome();
    } catch (e) {
      return;
    }
  }

  _navigateToHome() async {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    const mainColor = Color.fromRGBO(251, 152, 12, 1);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(image: AssetImage('assets/images/Group 1.png')),
          ],
        ),
      ),
    );
  }
}
