import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:login_binance_clone/controller/screen_controller.dart';
import 'package:login_binance_clone/utils/primary_config.dart';
import 'package:login_binance_clone/views/widgets/action_button_icon.dart';
import 'package:login_binance_clone/views/widgets/input_form_field.dart';
import 'package:login_binance_clone/views/widgets/navigation_button.dart';

class SignUpScreenView extends GetView<ScreenController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.personalPhoneFocusNode.unfocus();
        controller.personalEmailFocusNode.unfocus();
        controller.passwordFocusNode.unfocus();
        controller.referralIdFocusNode.unfocus();
      },
      child: Scaffold(
        backgroundColor: PrimaryConfig.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [ActionButtonIcon()],
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Personal Account',
                  style: TextStyle(fontFamily: PrimaryConfig.bold, fontSize: 30, color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildTabsCustomSection(),
                InputFormField(
                  controller: controller.isSelected.value ? controller.personalPhoneController : controller.personalEmailController,
                  title: controller.isSelected.value ? 'Personal Phone Number' : 'Personal Email',
                  focusNode: controller.isSelected.value ? controller.personalPhoneFocusNode : controller.personalEmailFocusNode,
                ),
                InputFormField(
                  controller: controller.passwordController,
                  title: 'Password',
                  focusNode: controller.passwordFocusNode,
                  obscureText: !controller.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    splashRadius: Material.defaultSplashRadius / 2,
                    onPressed: () {
                      controller.togglePasswordHidden();
                    },
                    icon: Icon(
                      controller.isPasswordHidden.value ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
                      size: 20,
                    ),
                    color: Colors.grey,
                  ),
                ).paddingSymmetric(vertical: 20),
                GestureDetector(
                  onTap: () {
                    controller.toggleReferralId();
                  },
                  child: Row(
                    children: [
                      Text(
                        'Referral ID (Optional)',
                        style: TextStyle(
                          color: PrimaryConfig.textColor,
                          fontFamily: PrimaryConfig.medium,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Icon(
                        controller.visibleReferralId.value ? FontAwesomeIcons.caretUp : FontAwesomeIcons.caretDown,
                        color: PrimaryConfig.textColor,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.visibleReferralId.value,
                  child: InputFormField(
                    controller: controller.referralIdController,
                    title: null,
                    focusNode: controller.referralIdFocusNode,
                  ),
                ),
                const SizedBox(height: 10),
                _buildAcceptTermsSection(),
                const NavigationButton(
                  btnName: 'Create Personal Account',
                  txtColor: Colors.black87,
                ).paddingSymmetric(vertical: 20),
                RichText(
                  text: TextSpan(
                    text: 'Not locking for a personal account?',
                    style: TextStyle(
                      color: PrimaryConfig.textColor,
                      fontFamily: PrimaryConfig.medium,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up for an\nentity account',
                        style: TextStyle(
                          color: PrimaryConfig.primaryButtonColor,
                          fontFamily: PrimaryConfig.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildAcceptTermsSection() {
    return GestureDetector(
      onTap: () {
        controller.toggleAcceptTerms();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.solidCircleCheck,
            size: 18,
            color: controller.isAcceptTerms.value ? PrimaryConfig.primaryColor : PrimaryConfig.textColor,
          ),
          const SizedBox(width: 10),
          RichText(
            text: const TextSpan(
              text: 'By creating and account, I agree to Binance\'s\n',
              style: TextStyle(
                color: PrimaryConfig.textColor,
              ),
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabsCustomSection() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            controller.toggleTabs();
          },
          child: Card(
            elevation: 0,
            color: controller.isSelected.value ? Colors.transparent : PrimaryConfig.boxColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Email',
              style: TextStyle(
                color: controller.isSelected.value ? PrimaryConfig.textColor : Colors.white,
              ),
            ).paddingSymmetric(horizontal: 15, vertical: 5),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.toggleTabs();
          },
          child: Card(
            elevation: 0,
            color: controller.isSelected.value ? PrimaryConfig.boxColor : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Phone Number',
              style: TextStyle(
                color: controller.isSelected.value ? Colors.white : PrimaryConfig.textColor,
              ),
            ).paddingSymmetric(horizontal: 15, vertical: 5),
          ),
        ),
      ],
    );
  }
}
