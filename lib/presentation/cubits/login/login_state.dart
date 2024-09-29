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
  final String message;

  const LoginSuccessfully(this.message);

  @override
  List<Object> get props => [message];
}
