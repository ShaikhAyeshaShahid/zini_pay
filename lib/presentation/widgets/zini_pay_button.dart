import 'package:flutter/material.dart';
import 'package:zini_pay/constants/colors.dart';

import '../../constants/size_config.dart';

class ZiniPayButton extends StatelessWidget {
  final String buttonText;
  final String? fontFamily;
  final VoidCallback onPressed;
  final double? radius;
  final double? padHor;
  final double? padVer;
  final double? marginHor;
  final double? marginVer;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const ZiniPayButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.radius,
    this.padHor,
    this.padVer,
    this.marginHor,
    this.marginVer,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.color,
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
          horizontal: SizeConfig.width(context, padHor ?? 0.07),
          vertical: SizeConfig.height(context, padVer ?? 0.01),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.width(context, marginHor ?? 0.02),
          vertical: SizeConfig.height(context, marginVer ?? 0.02),
        ),
        decoration: BoxDecoration(
          color:  GlobalColors.buttonColor,
          borderRadius: BorderRadius.circular(
            SizeConfig.width(context, radius ?? 1),
          ),
        ),
        child: Text(
          buttonText,
          style: GlobalColors.textStyle(
              fontSize: fontSize ?? SizeConfig.width(context, 0.05),
              color: color?? GlobalColors.greyBgColor,
              fontWeight: fontWeight ?? FontWeight.w500,
              fontFamily: fontFamily),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
