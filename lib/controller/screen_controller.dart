import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController {
  late TextEditingController emailController, personalPhoneController, personalEmailController, passwordController, referralIdController;
  late FocusNode emailFocusNode, personalPhoneFocusNode, personalEmailFocusNode, passwordFocusNode, referralIdFocusNode;

  RxBool isSelected = false.obs;
  RxBool isPasswordHidden = false.obs;
  RxBool visibleReferralId = false.obs;
  RxBool isAcceptTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    personalPhoneController = TextEditingController();
    personalEmailController = TextEditingController();
    passwordController = TextEditingController();
    referralIdController = TextEditingController();

    emailFocusNode = FocusNode();
    personalPhoneFocusNode = FocusNode();
    personalEmailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    referralIdFocusNode = FocusNode();
  }

  void toggleTabs() {
    isSelected.value = !isSelected.value;
  }

  void togglePasswordHidden() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleReferralId() {
    visibleReferralId.value = !visibleReferralId.value;
  }

  void toggleAcceptTerms() {
    isAcceptTerms.value = !isAcceptTerms.value;
  }
}
