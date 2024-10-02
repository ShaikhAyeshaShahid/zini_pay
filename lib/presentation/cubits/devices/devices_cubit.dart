import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zini_pay/domain/entities/DeviceModel.dart';

import '../../../constants/logger.dart';
import '../../../domain/usecases/device_usecase/device_usecase.dart';

part 'devices_state.dart';

class DevicesCubit extends Cubit<DevicesState> {
  final DeviceUsecase usecase;
  DevicesCubit(this.usecase) : super(DevicesInitial());



  void getDeviceList() async {
    try {
      emit(DeviceLoading());
      List<DeviceModel> deviceList = await usecase.getAllDevices();
      LogManager.info('cubit::deviceList = $deviceList');
      emit(DeviceFetched(devicesList: deviceList));
    } on Exception catch (e) {
      LogManager.error('cubit::deviceList::exception =', e);
      emit(DeviceError(e.toString().substring(11)));
      // throw Exception(e.toString().substring(11));
    }
  }
}
