import 'dart:convert';
/// error : false
/// message : "tables Get Successfully"
/// data : [{"id":"276","seller_id":"831","table":"1","status":"1","qr_code":"uploads/qrcode/1077033367.png"},{"id":"277","seller_id":"831","table":"2","status":"1","qr_code":"uploads/qrcode/714589692.png"},{"id":"278","seller_id":"831","table":"3","status":"1","qr_code":"uploads/qrcode/395251199.png"},{"id":"279","seller_id":"831","table":"4","status":"1","qr_code":"uploads/qrcode/1325932291.png"},{"id":"280","seller_id":"831","table":"5","status":"1","qr_code":"uploads/qrcode/1307524719.png"},{"id":"281","seller_id":"831","table":"6","status":"1","qr_code":"uploads/qrcode/648742843.png"},{"id":"282","seller_id":"831","table":"7","status":"1","qr_code":"uploads/qrcode/1308279907.png"},{"id":"283","seller_id":"831","table":"8","status":"1","qr_code":"uploads/qrcode/1967801891.png"},{"id":"284","seller_id":"831","table":"9","status":"1","qr_code":"uploads/qrcode/1312249609.png"},{"id":"285","seller_id":"831","table":"10","status":"1","qr_code":"uploads/qrcode/801701266.png"},{"id":"286","seller_id":"831","table":"11","status":"1","qr_code":"uploads/qrcode/1854844579.png"},{"id":"287","seller_id":"831","table":"12","status":"1","qr_code":"uploads/qrcode/293489723.png"},{"id":"288","seller_id":"831","table":"13","status":"1","qr_code":"uploads/qrcode/1850901220.png"},{"id":"289","seller_id":"831","table":"14","status":"1","qr_code":"uploads/qrcode/65676515.png"},{"id":"290","seller_id":"831","table":"15","status":"1","qr_code":"uploads/qrcode/1560176987.png"},{"id":"291","seller_id":"831","table":"16","status":"1","qr_code":"uploads/qrcode/1856756239.png"},{"id":"292","seller_id":"831","table":"17","status":"1","qr_code":"uploads/qrcode/1456891884.png"},{"id":"293","seller_id":"831","table":"18","status":"1","qr_code":"uploads/qrcode/1020954787.png"},{"id":"294","seller_id":"831","table":"19","status":"1","qr_code":"uploads/qrcode/1316552641.png"},{"id":"295","seller_id":"831","table":"20","status":"1","qr_code":"uploads/qrcode/1097299420.png"},{"id":"296","seller_id":"831","table":"21","status":"1","qr_code":"uploads/qrcode/1771941849.png"},{"id":"297","seller_id":"831","table":"22","status":"1","qr_code":"uploads/qrcode/1248293234.png"},{"id":"298","seller_id":"831","table":"23","status":"1","qr_code":"uploads/qrcode/1713256481.png"},{"id":"299","seller_id":"831","table":"24","status":"1","qr_code":"uploads/qrcode/1077888673.png"},{"id":"300","seller_id":"831","table":"25","status":"1","qr_code":"uploads/qrcode/1629116711.png"},{"id":"301","seller_id":"831","table":"26","status":"1","qr_code":"uploads/qrcode/700841625.png"},{"id":"302","seller_id":"831","table":"27","status":"1","qr_code":"uploads/qrcode/335559421.png"},{"id":"303","seller_id":"831","table":"28","status":"1","qr_code":"uploads/qrcode/357953353.png"},{"id":"304","seller_id":"831","table":"29","status":"1","qr_code":"uploads/qrcode/1308082010.png"},{"id":"305","seller_id":"831","table":"30","status":"1","qr_code":"uploads/qrcode/203059030.png"},{"id":"306","seller_id":"831","table":"31","status":"1","qr_code":"uploads/qrcode/1949241661.png"},{"id":"307","seller_id":"831","table":"32","status":"1","qr_code":"uploads/qrcode/2050903911.png"},{"id":"308","seller_id":"831","table":"33","status":"1","qr_code":"uploads/qrcode/1249214827.png"},{"id":"309","seller_id":"831","table":"34","status":"1","qr_code":"uploads/qrcode/1082624273.png"},{"id":"310","seller_id":"831","table":"35","status":"1","qr_code":"uploads/qrcode/413495524.png"},{"id":"311","seller_id":"831","table":"36","status":"1","qr_code":"uploads/qrcode/390799660.png"},{"id":"312","seller_id":"831","table":"37","status":"1","qr_code":"uploads/qrcode/779640625.png"},{"id":"313","seller_id":"831","table":"38","status":"1","qr_code":"uploads/qrcode/903716441.png"},{"id":"314","seller_id":"831","table":"39","status":"1","qr_code":"uploads/qrcode/480879034.png"},{"id":"315","seller_id":"831","table":"40","status":"1","qr_code":"uploads/qrcode/158235022.png"},{"id":"316","seller_id":"831","table":"41","status":"1","qr_code":"uploads/qrcode/860481022.png"},{"id":"317","seller_id":"831","table":"42","status":"1","qr_code":"uploads/qrcode/885050091.png"},{"id":"318","seller_id":"831","table":"43","status":"1","qr_code":"uploads/qrcode/838355565.png"},{"id":"319","seller_id":"831","table":"44","status":"1","qr_code":"uploads/qrcode/688502702.png"},{"id":"320","seller_id":"831","table":"45","status":"1","qr_code":"uploads/qrcode/589913034.png"},{"id":"321","seller_id":"831","table":"46","status":"1","qr_code":"uploads/qrcode/571120957.png"},{"id":"322","seller_id":"831","table":"47","status":"1","qr_code":"uploads/qrcode/1557768566.png"},{"id":"323","seller_id":"831","table":"48","status":"1","qr_code":"uploads/qrcode/1036123500.png"},{"id":"324","seller_id":"831","table":"49","status":"1","qr_code":"uploads/qrcode/1235237609.png"},{"id":"325","seller_id":"831","table":"50","status":"1","qr_code":"uploads/qrcode/1975064788.png"}]

TableModel tableModelFromJson(String str) => TableModel.fromJson(json.decode(str));
String tableModelToJson(TableModel data) => json.encode(data.toJson());
class TableModel {
  TableModel({
      bool? error, 
      String? message, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  TableModel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  List<Data>? _data;
TableModel copyWith({  bool? error,
  String? message,
  List<Data>? data,
}) => TableModel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "276"
/// seller_id : "831"
/// table : "1"
/// status : "1"
/// qr_code : "uploads/qrcode/1077033367.png"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? sellerId, 
      String? table, 
      String? status, 
      String? qrCode,}){
    _id = id;
    _sellerId = sellerId;
    _table = table;
    _status = status;
    _qrCode = qrCode;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _sellerId = json['seller_id'];
    _table = json['table'];
    _status = json['status'];
    _qrCode = json['qr_code'];
  }
  String? _id;
  String? _sellerId;
  String? _table;
  String? _status;
  String? _qrCode;
Data copyWith({  String? id,
  String? sellerId,
  String? table,
  String? status,
  String? qrCode,
}) => Data(  id: id ?? _id,
  sellerId: sellerId ?? _sellerId,
  table: table ?? _table,
  status: status ?? _status,
  qrCode: qrCode ?? _qrCode,
);
  String? get id => _id;
  String? get sellerId => _sellerId;
  String? get table => _table;
  String? get status => _status;
  String? get qrCode => _qrCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['seller_id'] = _sellerId;
    map['table'] = _table;
    map['status'] = _status;
    map['qr_code'] = _qrCode;
    return map;
  }

}