class OrderStatusModel {
  OrderStatusModel({
      this.error, 
      this.message,});

  OrderStatusModel.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
  }
  bool? error;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    map['message'] = message;
    return map;
  }

}