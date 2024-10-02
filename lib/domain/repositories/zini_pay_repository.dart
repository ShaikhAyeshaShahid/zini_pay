

import 'package:zini_pay/domain/entities/DeviceModel.dart';
import 'package:zini_pay/domain/entities/SmsModel.dart';

abstract class ZiniPayRepository {
  Future<String> login(
    String email,
    String apiKey,
  );
  Future<String> smsSync();
  Future<List<SmsModel>> Sms();
  Future<List<DeviceModel>> Devices();
}
