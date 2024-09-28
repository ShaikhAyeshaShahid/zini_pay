import 'package:flutter/material.dart';
import 'package:zini_pay/constants/router.dart';
import 'package:zini_pay/presentation/screens/login_screen.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.loginScreen,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.loginScreen) {
      return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
    if (settings.name == AppRoutes.homeScreen) {
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
    return null;
  }
}
