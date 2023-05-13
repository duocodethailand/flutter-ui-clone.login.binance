import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_binance_clone/controller/screen_controller.dart';
import 'package:login_binance_clone/utils/primary_config.dart';
import 'package:login_binance_clone/views/splash_screen_view.dart';

void main() {
  Get.put(ScreenController());
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: PrimaryConfig.regular,
      ),
      home: const SplashScreenView(),
    );
  }
}
