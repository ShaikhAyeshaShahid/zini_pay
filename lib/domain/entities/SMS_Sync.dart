/// success : true
/// message : "SMS synced successfully."

class SmsSync {
  SmsSync({
      bool? success, 
      String? message,}){
    _success = success;
    _message = message;
}

  SmsSync.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  bool? _success;
  String? _message;
SmsSync copyWith({  bool? success,
  String? message,
}) => SmsSync(  success: success ?? _success,
  message: message ?? _message,
);
  bool? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }

}