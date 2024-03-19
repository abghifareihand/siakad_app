import 'package:flutter/material.dart';
import 'package:siakad_app/core/components/button.dart';
import 'package:siakad_app/core/constants/colors.dart';
import 'package:siakad_app/core/constants/images.dart';
import 'package:siakad_app/presentation/auth/widgets/login_bottom_sheet.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              width: 250,
              Images.orangbuku,
            ),
            Text(
              'SIAKAD',
              style: primaryTextStyle.copyWith(
                fontSize: 30,
                fontWeight: bold,
              ),
            ),
            Text(
              'Sistem Informasi Akademik',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Button.primary(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              isScrollControlled: true,
              builder: (context) {
                return const LoginBottomSheet();
              },
            );
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
