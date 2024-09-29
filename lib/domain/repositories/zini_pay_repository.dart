import 'package:zini_pay/domain/entities/AuthModel.dart';

abstract class ZiniPayRepository {
  Future<String> login(
    String email,
    String apiKey,
  );
  Future<String> smsSync();
}
