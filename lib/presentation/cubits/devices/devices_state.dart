part of 'devices_cubit.dart';

sealed class DevicesState extends Equatable {
  const DevicesState();
}

final class DevicesInitial extends DevicesState {
  @override
  List<Object> get props => [];
}

class DeviceLoading extends DevicesState {
  @override
  List<Object> get props => [];
}

class DeviceFetched extends DevicesState {
  final List<DeviceModel> devicesList;

  const DeviceFetched({required this.devicesList});

  @override
  List<Object> get props => [devicesList];
}

class DeviceError extends DevicesState {
  final String errorMessage;

  const DeviceError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
