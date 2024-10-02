import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zini_pay/domain/entities/SmsModel.dart';
import 'package:zini_pay/domain/usecases/sms_usecase/sms.dart';
import 'package:zini_pay/presentation/cubits/smsSync/sms_sync_cubit.dart';

import '../../../constants/logger.dart';

part 'sms_state.dart';

class SmsCubit extends Cubit<SmsState> {
  final SmsUsecase usecase;

  SmsCubit(this.usecase) : super(SmsInitial());
  void getSmsList() async {
    try {
      emit(smsLoading());
      List<SmsModel> smsList = await usecase.getAllSms();
      LogManager.info('cubit::smsList = $smsList');
      emit(smsFetched(smsList: smsList));
    } on Exception catch (e) {
      LogManager.error('cubit::smsList::exception =', e);
      emit(smsError(e.toString().substring(11)));
      // throw Exception(e.toString().substring(11));
    }
  }

}
