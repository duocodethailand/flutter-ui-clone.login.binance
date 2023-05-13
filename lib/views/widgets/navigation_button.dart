import 'package:flutter/material.dart';
import 'package:login_binance_clone/utils/primary_config.dart';

class NavigationButton extends StatelessWidget {
  final String? btnName;
  final Color? txtColor;
  final Color? backgroundColor;
  final String? iconImage;
  const NavigationButton({
    super.key,
    required this.btnName,
    this.txtColor,
    this.backgroundColor,
    this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor ?? PrimaryConfig.primaryButtonColor),
        onPressed: () {},
        child: SizedBox(
          height: 50,
          child: Center(
              child: Row(
            children: [
              iconImage != null
                  ? Image.asset(
                      iconImage!,
                      width: 20,
                    )
                  : const SizedBox(),
              Expanded(
                  child: Center(
                child: Text(
                  btnName!,
                  style: TextStyle(
                    color: txtColor ?? Colors.white,
                    fontSize: 17,
                  ),
                ),
              ))
            ],
          )),
        ));
  }
}
