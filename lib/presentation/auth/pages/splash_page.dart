import 'package:flutter/material.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/presentation/auth/pages/auth_page.dart';
import 'package:siakad_app/presentation/auth/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          'assets/images/orangbuku.png',
          width: 250,
        ),
      ),
    );
  }
}
