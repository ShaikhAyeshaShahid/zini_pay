import 'package:zini_pay/domain/entities/AuthModel.dart';
import 'package:zini_pay/domain/entities/SmsModel.dart';
import 'package:zini_pay/domain/repositories/zini_pay_repository.dart';

import '../../../constants/logger.dart';

class SmsUsecase {
  final ZiniPayRepository repository;

  SmsUsecase(this.repository);

  Future<List<SmsModel>> getAllSms() async {
    try {
      List<SmsModel> smsList = await repository.Sms();
      LogManager.info('usecase::smsList = $smsList');
      return smsList;
    } on Exception catch (e) {
      LogManager.error('usecase::smsList::exception =', e);
      throw Exception(e.toString().substring(11));
    }
  }
}
