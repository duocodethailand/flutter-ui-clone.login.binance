import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_binance_clone/utils/primary_config.dart';
import 'package:login_binance_clone/views/login_screen_view.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.to(() => const LoginScreenView());
    });
    return Scaffold(
      backgroundColor: PrimaryConfig.primaryBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/images/binance_logo.png',
          width: 180,
        ),
      ),
    );
  }
}
