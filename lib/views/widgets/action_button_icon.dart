import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:login_binance_clone/utils/primary_config.dart';

class ActionButtonIcon extends StatelessWidget {
  const ActionButtonIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13, bottom: 13, right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: PrimaryConfig.borderColor,
      ),
      child: Row(
        children: [
          const Icon(
            FontAwesomeIcons.ellipsis,
            color: PrimaryConfig.textColor,
            size: 20,
          ),
          const VerticalDivider(
            width: 1,
            thickness: 1,
            color: Colors.white,
          ).paddingSymmetric(vertical: 8, horizontal: 8),
          const Icon(
            FontAwesomeIcons.solidCircleXmark,
            color: PrimaryConfig.textColor,
            size: 20,
          )
        ],
      ).paddingOnly(left: 10, right: 10),
    );
  }
}
