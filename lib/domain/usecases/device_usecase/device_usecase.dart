import 'package:zini_pay/domain/entities/DeviceModel.dart';

import '../../../constants/logger.dart';
import '../../repositories/zini_pay_repository.dart';

class DeviceUsecase {
  final ZiniPayRepository repository;

  DeviceUsecase(this.repository);

  Future<List<DeviceModel>> getAllDevices() async {
    try {
      List<DeviceModel> devicesList = await repository.Devices();
      LogManager.info('usecase::devicesList = $devicesList');
      return devicesList;
    } on Exception catch (e) {
      LogManager.error('usecase::devicesList::exception =', e);
      throw Exception(e.toString().substring(11));
    }
  }
}