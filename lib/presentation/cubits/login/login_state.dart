part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoginSuccessfully extends LoginState {
  final AuthModel authModel;

  const LoginSuccessfully(this.authModel);

  @override
  List<Object> get props => [authModel];
}
