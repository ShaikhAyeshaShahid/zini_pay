import 'package:zini_pay/domain/entities/AuthModel.dart';

abstract class ZiniPayRepository {
  Future<AuthModel> login(
    String email,
    String apiKey,
  );
}
