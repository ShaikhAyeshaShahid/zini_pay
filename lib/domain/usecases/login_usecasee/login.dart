import 'package:zini_pay/domain/entities/AuthModel.dart';
import 'package:zini_pay/domain/repositories/zini_pay_repository.dart';

import '../../../constants/logger.dart';

class LoginUsecase {
  final ZiniPayRepository repository;

  LoginUsecase(this.repository);

  Future<AuthModel> login(String email, String apiKey) async {
    try {
      return await repository.login(email, apiKey);
    } on Exception catch (e) {
      LogManager.error('usecase::login::exception =', e);
      throw Exception(e.toString().substring(11));
    }
  }
}
