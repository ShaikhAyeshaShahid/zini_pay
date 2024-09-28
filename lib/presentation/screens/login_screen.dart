import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zini_pay/constants/colors.dart';
import 'package:zini_pay/constants/router.dart';
import 'package:zini_pay/constants/size_config.dart';
import 'package:zini_pay/presentation/screens/home_screen.dart';

import '../../constants/divider.dart';
import '../../constants/images.dart';
import '../cubits/login/login_cubit.dart';
import '../widgets/zini_pay_button.dart';
import '../widgets/zini_pay_text_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginCubit cubit;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController apiKeyController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    cubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
          if (state is LoginSuccessfully) {
           /* ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                'password verified successfully',
              ),
            ));*/
            Navigator.pushNamed(context, AppRoutes.homeScreen);
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ZiniPayButton(
            marginHor: 0.05,
            buttonText: 'Log In',
            onPressed: () {
              if(_formKey.currentState!.validate()){
                cubit.login(emailController.text, apiKeyController.text);
              }
            },
          );
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.height(context, 1),
          width: SizeConfig.width(context, 1),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.width(context, 0.05),
              vertical: SizeConfig.height(context, 0.02)),
          child: Form(
            key: _formKey,
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
                buildVerticalDivider(context: context, fraction: 0.01),
                ZiniPayTextFormField(
                  controller: emailController,
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
                buildVerticalDivider(context: context, fraction: 0.01),
                ZiniPayTextFormField(
                  controller: apiKeyController,
                  hintText: '',
                  keyboardType: TextInputType.visiblePassword,
                ),
                buildVerticalDivider(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
