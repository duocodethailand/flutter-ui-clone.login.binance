import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_binance_clone/controller/screen_controller.dart';
import 'package:login_binance_clone/utils/primary_config.dart';
import 'package:login_binance_clone/views/sign_up_screen_view.dart';
import 'package:login_binance_clone/views/widgets/action_button_icon.dart';
import 'package:login_binance_clone/views/widgets/input_form_field.dart';
import 'package:login_binance_clone/views/widgets/navigation_button.dart';

class LoginScreenView extends GetView<ScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.emailFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: PrimaryConfig.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: const [ActionButtonIcon()],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
                fontFamily: PrimaryConfig.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InputFormField(
              title: 'Email / Phone Number',
              controller: controller.emailController,
              focusNode: controller.emailFocusNode,
              keyboardType: TextInputType.emailAddress,
            ),
            const NavigationButton(
              btnName: 'Next',
              txtColor: Colors.black,
            ).paddingSymmetric(vertical: 20),
            _buildDivider(),
            const NavigationButton(
              iconImage: 'assets/images/google_logo.png',
              btnName: 'Create a Binance Account',
              txtColor: Colors.white,
              backgroundColor: PrimaryConfig.secondaryButtonColor,
            ).paddingSymmetric(vertical: 20),
            GestureDetector(
              onTap: () {
                Get.to(() => const SignUpScreenView(), transition: Transition.rightToLeftWithFade);
              },
              child: const Text(
                'Create a Binance Account',
                style: TextStyle(
                  color: PrimaryConfig.primaryColor,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ).paddingSymmetric(horizontal: 18),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Flexible(
          flex: 2,
          child: Divider(
            color: PrimaryConfig.textColor,
          ),
        ),
        const Text(
          'or',
          style: TextStyle(color: PrimaryConfig.textColor, fontSize: 16),
        ).paddingSymmetric(horizontal: 8),
        const Flexible(
          flex: 2,
          child: Divider(
            color: PrimaryConfig.textColor,
          ),
        ),
      ],
    );
  }
}
