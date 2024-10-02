/// _id : "66a9b77d1f3b2dd18611b75a"
/// email : "user5@example.com"
/// apiKey : "apikey5"
/// deviceName : "Device E"
/// deviceModel : "Model V"
/// registeredAt : "2024-05-01T14:00:00Z"

class DeviceModel {
  DeviceModel({
      String? id, 
      String? email, 
      String? apiKey, 
      String? deviceName, 
      String? deviceModel, 
      String? registeredAt,}){
    _id = id;
    _email = email;
    _apiKey = apiKey;
    _deviceName = deviceName;
    _deviceModel = deviceModel;
    _registeredAt = registeredAt;
}

  DeviceModel.fromJson(dynamic json) {
    _id = json['_id'];
    _email = json['email'];
    _apiKey = json['apiKey'];
    _deviceName = json['deviceName'];
    _deviceModel = json['deviceModel'];
    _registeredAt = json['registeredAt'];
  }
  String? _id;
  String? _email;
  String? _apiKey;
  String? _deviceName;
  String? _deviceModel;
  String? _registeredAt;
DeviceModel copyWith({  String? id,
  String? email,
  String? apiKey,
  String? deviceName,
  String? deviceModel,
  String? registeredAt,
}) => DeviceModel(  id: id ?? _id,
  email: email ?? _email,
  apiKey: apiKey ?? _apiKey,
  deviceName: deviceName ?? _deviceName,
  deviceModel: deviceModel ?? _deviceModel,
  registeredAt: registeredAt ?? _registeredAt,
);
  String? get id => _id;
  String? get email => _email;
  String? get apiKey => _apiKey;
  String? get deviceName => _deviceName;
  String? get deviceModel => _deviceModel;
  String? get registeredAt => _registeredAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['email'] = _email;
    map['apiKey'] = _apiKey;
    map['deviceName'] = _deviceName;
    map['deviceModel'] = _deviceModel;
    map['registeredAt'] = _registeredAt;
    return map;
  }

}