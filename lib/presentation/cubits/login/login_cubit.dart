import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zini_pay/domain/entities/AuthModel.dart';
import 'package:zini_pay/domain/usecases/login_usecase/login.dart';

import '../../../constants/logger.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase usecase;

  LoginCubit(this.usecase) : super(LoginInitial());

  void login(String email, String apiKey) async {
    try {
      emit(LoginLoading());
      String message = await usecase.login(email, apiKey);
      emit(LoginSuccessfully(message));
    } on Exception catch (e) {
      LogManager.error('cubit::login::exception =', e);
      emit(LoginFailed(e.toString().substring(11)));
    }
  }
}
