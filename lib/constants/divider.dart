import 'package:flutter/material.dart';

import 'size_config.dart';

SizedBox buildVerticalDivider(
        {required BuildContext context, double? fraction}) =>
    SizedBox(height: SizeConfig.height(context, fraction ?? 0.02));

SizedBox buildHorizontalDivider(
    {required BuildContext context, double? fraction}) {
  return SizedBox(width: SizeConfig.width(context, fraction ?? 0.02));
}
