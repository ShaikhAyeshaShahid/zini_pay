import 'package:flutter/material.dart';
import 'package:zini_pay/constants/size_config.dart';

SizedBox buildVerticalSpacing(BuildContext context, double fraction) {
  return SizedBox(height: SizeConfig.height(context, fraction));
}
