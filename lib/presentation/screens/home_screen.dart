import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zini_pay/constants/divider.dart';
import 'package:zini_pay/presentation/cubits/smsSync/sms_sync_cubit.dart';

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
  late SmsSyncCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<SmsSyncCubit>(context);
    super.initState();
  }

  final service = FlutterBackgroundService();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocConsumer<SmsSyncCubit, SmsSyncState>(
        listener: (context, state) {
          if (state is SmsSyncLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('SMS syncing started')),
            );
          } else if (state is SmsSyncSuccessfully) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is SmsSyncFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ZiniPayButton(
                padHor: 0,
                padVer: 0,
                marginHor: 0.1,
                buttonText: state is SmsSyncLoading ? 'Stop' : 'Start',
                // buttonText: state is SmsSyncLoading ? 'Stop' : 'Start',
                radius: 0.03,
                fontSize: SizeConfig.width(context, 0.09),
                fontFamily: "Acme",
                color: Colors.white,
                onPressed: () async {
                  bool isRunning = await service.isRunning();
                  if (isRunning) {
                    service.invoke("stopService");
                  } else {
                    service.startService();
                  }
                  if (!isRunning) {
                    text = "stop Service";
                  } else {
                    text = "start Service";
                  }

                  /* if (state is! SmsSyncLoading) {
                    cubit.smsSync();
                  }*/
                },
              ),
              ZiniPayButton(
                padHor: 0,
                padVer: 0,
                marginHor: 0.1,
                buttonText: 'Foreground',
                radius: 0.03,
                fontSize: SizeConfig.width(context, 0.09),
                fontFamily: "Acme",
                color: Colors.white,
                onPressed: () {
                  FlutterBackgroundService().invoke("setAsForeground");
                },
              ),
              ZiniPayButton(
                padHor: 0,
                padVer: 0,
                marginHor: 0.1,
                buttonText: 'Background',
                radius: 0.03,
                fontSize: SizeConfig.width(context, 0.09),
                fontFamily: "Acme",
                color: Colors.white,
                onPressed: () {
                  FlutterBackgroundService().invoke("setAsBackground");
                },
              ),
            ],
          );
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
