import 'package:flutter/material.dart';
import 'package:newsapp/view/login_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}
