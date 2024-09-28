import 'package:flutter/material.dart';
import 'package:zini_pay/constants/divider.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/router.dart';
import '../../constants/size_config.dart';
import '../widgets/zini_pay_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ZiniPayButton(
        padHor: 0,
        padVer: 0,
        marginHor: 0.1,
        buttonText: 'Stop',
        radius: 0.03,
        fontSize: SizeConfig.width(context, 0.09),
        fontFamily: "Acme",
        color: Colors.white,
        onPressed: () {
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
          Navigator.pushNamed(context, AppRoutes.homeScreen);
        },
      ),
      body: Container(
        height: SizeConfig.height(context, 1),
        width: SizeConfig.width(context, 1),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.width(context, 0.05),
            vertical: SizeConfig.height(context, 0.02)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Images.homeImage,
              scale: SizeConfig.width(context, 0.004),
            ),
            buildVerticalDivider(context: context),
            Text(
              "Active",
              style: GlobalColors.textStyle(
                  color: Colors.black,
                  fontFamily: "Acme",
                  fontSize: SizeConfig.width(context, 0.1),
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
