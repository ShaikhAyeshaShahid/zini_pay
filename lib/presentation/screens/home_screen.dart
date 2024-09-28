import 'package:flutter/material.dart';

import '../../constants/images.dart';
import '../../constants/size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}
