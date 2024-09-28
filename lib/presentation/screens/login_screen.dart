import 'package:flutter/material.dart';
import 'package:zini_pay/constants/colors.dart';
import 'package:zini_pay/constants/router.dart';
import 'package:zini_pay/constants/size_config.dart';
import 'package:zini_pay/presentation/screens/home_screen.dart';

import '../../constants/divider.dart';
import '../../constants/images.dart';
import '../widgets/zini_pay_button.dart';
import '../widgets/zini_pay_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.height(context, 1),
          width: SizeConfig.width(context, 1),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(context, 0.05),
              vertical: SizeConfig.height(context, 0.02)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.loginImage,
                scale: SizeConfig.width(context, 0.006),
              ),
              buildVerticalDivider(
                context: context,
              ),
              Text(
                "Log in",
                style: GlobalColors.textStyle(),
              ),
              buildVerticalDivider(
                context: context,
              ),
              buildVerticalDivider(context: context),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: GlobalColors.textStyleField(),
                  textAlign: TextAlign.start,
                ),
              ),
              buildVerticalDivider(context: context),
              ZiniPayTextFormField(
                hintText: 'Johndoe@exemple.com',
                keyboardType: TextInputType.emailAddress,
              ),
              buildVerticalDivider(context: context),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Api Key",
                  style: GlobalColors.textStyleField(),
                  textAlign: TextAlign.start,
                ),
              ),
              buildVerticalDivider(context: context),
              ZiniPayTextFormField(
                hintText: '',
                keyboardType: TextInputType.visiblePassword,
              ),
              buildVerticalDivider(context: context),
              ZiniPayButton(
                buttonText: 'Log In',
                onPressed: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  Navigator.pushNamed(context, AppRoutes.homeScreen);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
