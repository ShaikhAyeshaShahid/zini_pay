/// _id : "66fc1f31db3859c3408b3c0f"
/// message : "Message after reconnection"
/// from : "+1234567890"
/// time : "2024-10-01T21:41:27.770626"

class SmsModel {
  SmsModel({
      String? id, 
      String? message, 
      String? from, 
      String? time,}){
    _id = id;
    _message = message;
    _from = from;
    _time = time;
}

  SmsModel.fromJson(dynamic json) {
    _id = json['_id'];
    _message = json['message'];
    _from = json['from'];
    _time = json['time'];
  }
  String? _id;
  String? _message;
  String? _from;
  String? _time;
SmsModel copyWith({  String? id,
  String? message,
  String? from,
  String? time,
}) => SmsModel(  id: id ?? _id,
  message: message ?? _message,
  from: from ?? _from,
  time: time ?? _time,
);
  String? get id => _id;
  String? get message => _message;
  String? get from => _from;
  String? get time => _time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['message'] = _message;
    map['from'] = _from;
    map['time'] = _time;
    return map;
  }

}