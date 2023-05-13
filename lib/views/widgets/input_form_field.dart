import 'package:flutter/material.dart';
import 'package:login_binance_clone/utils/primary_config.dart';

class InputFormField extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final String? title;
  final FocusNode? focusNode;
  final bool? obscureText;
  const InputFormField({
    super.key,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
    required this.controller,
    required this.title,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: TextStyle(
                  color: PrimaryConfig.textColor,
                  fontFamily: PrimaryConfig.medium,
                  fontSize: 16,
                ),
              )
            : const SizedBox(),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 16),
          margin: EdgeInsets.zero,
          height: 50,
          decoration: BoxDecoration(color: PrimaryConfig.secondaryColor, borderRadius: BorderRadius.circular(5)),
          child: TextFormField(
            focusNode: focusNode,
            obscureText: obscureText ?? false,
            keyboardType: keyboardType,
            controller: controller,
            cursorColor: PrimaryConfig.primaryColor,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(border: InputBorder.none, suffixIcon: suffixIcon),
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
