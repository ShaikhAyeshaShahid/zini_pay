import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zini_pay/constants/router.dart';
import 'package:zini_pay/data/zini_pay_repository_impl.dart';
import 'package:zini_pay/domain/repositories/zini_pay_repository.dart';
import 'package:zini_pay/domain/usecases/login_usecase/login.dart';
import 'package:zini_pay/domain/usecases/sms_sync_usecase/sms_sync.dart';
import 'package:zini_pay/presentation/cubits/login/login_cubit.dart';
import 'package:zini_pay/presentation/cubits/smsSync/sms_sync_cubit.dart';
import 'package:zini_pay/presentation/screens/login_screen.dart';

import 'presentation/screens/home_screen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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

  PageRouteBuilder<dynamic> pageRouteBuilder(Widget screenRoute) {
    return PageRouteBuilder(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return screenRoute;
      },
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route? _onGenerateRoute(RouteSettings settings) {
    if (settings.name == AppRoutes.loginScreen) {
      return pageRouteBuilder(_loginScreen());
    }
    if (settings.name == AppRoutes.homeScreen) {
      return pageRouteBuilder(_homeScreen());
    }
    return null;
  }

  BlocProvider<LoginCubit> _loginScreen() {
    return BlocProvider(
      create: (context) => LoginCubit(LoginUsecase(repository)),
      child: LoginScreen(),
    );
  }

  BlocProvider<SmsSyncCubit> _homeScreen() {
    return BlocProvider(
      create: (context) => SmsSyncCubit(SmsSyncUsecase(repository)),
      child: HomeScreen(),
    );
  }

  var repository = ZiniPayRepositoryImplementation();
}
