part of 'sms_cubit.dart';

sealed class SmsState extends Equatable {
  const SmsState();
}

final class SmsInitial extends SmsState {
  @override
  List<Object> get props => [];
}
class smsLoading extends SmsState {
  @override
  List<Object> get props => [];
}

class smsFetched extends SmsState {
  final List<SmsModel> smsList;

  const smsFetched({required this.smsList});

  @override
  List<Object> get props => [smsList];
}

class smsError extends SmsState {
  final String errorMessage;

  const smsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
