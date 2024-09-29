import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zini_pay/domain/usecases/sms_sync_usecase/sms_sync.dart';

import '../../../constants/logger.dart';

part 'sms_sync_state.dart';

class SmsSyncCubit extends Cubit<SmsSyncState> {
  final SmsSyncUsecase usecase;

  SmsSyncCubit(this.usecase) : super(SmsSyncInitial());

  void smsSync() async {
    try {
      emit(SmsSyncLoading());
      String message = await usecase.smsSync();
      emit(SmsSyncSuccessfully(message));
    } on Exception catch (e) {
      LogManager.error('cubit::SmsSyncCubit::exception =', e);
      emit(SmsSyncFailed(e.toString().substring(11)));
    }
  }
}
