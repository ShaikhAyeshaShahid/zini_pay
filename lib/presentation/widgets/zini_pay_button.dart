import 'package:flutter/material.dart';
import 'package:zini_pay/constants/colors.dart';

import '../../constants/size_config.dart';

class ZiniPayButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ZiniPayButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: SizeConfig.width(context, 1),
        height: SizeConfig.height(context, 0.07),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(context, 0.07),
          vertical: SizeConfig.width(context, 0.02),
        ),
        decoration: BoxDecoration(
          color: GlobalColors.buttonColor,
          borderRadius: BorderRadius.circular(SizeConfig.width(context, 1)),
        ),
        child: Text(
          buttonText,
          style: GlobalColors.textStyle(
            fontSize: SizeConfig.width(context, 0.04),
            color: GlobalColors.greyBgColor,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
