import 'package:zini_pay/domain/entities/AuthModel.dart';
import 'package:zini_pay/domain/repositories/zini_pay_repository.dart';

import '../../../constants/logger.dart';

class SmsSyncUsecase {
  final ZiniPayRepository repository;

  SmsSyncUsecase(this.repository);

  Future<String> smsSync() async {
    try {
      return await repository.smsSync();
    } on Exception catch (e) {
      LogManager.error('usecase::smsSync::exception =', e);
      throw Exception(e.toString().substring(11));
    }
  }
}
