part of 'sms_sync_cubit.dart';

sealed class SmsSyncState extends Equatable {
  const SmsSyncState();
}

final class SmsSyncInitial extends SmsSyncState {
  @override
  List<Object> get props => [];
}
class SmsSyncLoading extends SmsSyncState {
  @override
  List<Object> get props => [];
}

class SmsSyncFailed extends SmsSyncState {
  final String errorMessage;

  const SmsSyncFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class SmsSyncSuccessfully extends SmsSyncState {
  final String message;

  const SmsSyncSuccessfully(this.message);

  @override
  List<Object> get props => [message];
}