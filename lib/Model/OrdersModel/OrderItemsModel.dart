import 'package:eshopmultivendor/Helper/String.dart';

class OrderItem {
  String? id,
      name,
      qty,
      price,
      vendorStatus,
      selected,
      estimateTime,
      subTotal,
      status,
      image,
      varientId,
      isCancle,
      activeStatus,
      isReturn,
      isAlrCancelled,
      isAlrReturned,
      rtnReqSubmitted,
      varient_values,
      attr_name,
      productId,
      curSelected,
      deliveryBoyId,
      delivery_boy_name,
      deliverBy;
  int? minute;
  Duration? duration;
  List<String?>? listStatus = [];
  List<String?>? listDate = [];

  OrderItem(
      {this.qty,
      this.id,
        this.minute,
        this.duration,
        this.delivery_boy_name,
      this.name,
      this.price,
      this.subTotal,
      this.status,
        this.selected,
      this.image,
        this.estimateTime,
      this.varientId,
        this.vendorStatus,
      this.activeStatus,
      this.listDate,
      this.listStatus,
      this.isCancle,
      this.isReturn,
      this.isAlrReturned,
      this.isAlrCancelled,
      this.rtnReqSubmitted,
      this.attr_name,
      this.productId,
      this.varient_values,
      this.curSelected,
      this.deliveryBoyId,
      this.deliverBy});

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    List<String?> lStatus = [];
    List<String?> lDate = [];

    var allSttus = json[STATUS];
    for (var curStatus in allSttus) {
      lStatus.add(curStatus[0]);
      lDate.add(curStatus[1]);
    }
    List<String> split = json['estimate_time']!=""&&json['estimate_time']!=null&&!json['estimate_time'].toString().contains("null")?json['estimate_time'].toString().split(":"):["0"];
    return new OrderItem(
        id: json[Id],
        qty: json[Quantity],
        name: json[Name],
        duration:Duration(minutes:  int.parse(split[0].toString())),
        minute: int.parse(split[0].toString())*60,
        estimateTime: json['estimate_time'],
        delivery_boy_name: json["delivery_boy_name"],
        activeStatus: json[ActiveStatus],
        image: json[IMage],
        vendorStatus : json['vendor_status'],
        price: json[Price],
        subTotal: json[SubTotal],
        varientId: json[ProductVariantId],
        listStatus: lStatus,
        status: json[ActiveStatus],
        curSelected: json[ActiveStatus],
        listDate: lDate,
        isCancle: json[IsCancelable],
        isReturn: json[IsReturnable],
        isAlrCancelled: json[IsAlreadyCancelled],
        isAlrReturned: json[IsAlreadyReturned],
        rtnReqSubmitted: json[ReturnRequestSubmitted],
        attr_name: json[AttrName],
        productId: json[ProductId],
        varient_values: json[VariantValues],
        deliveryBoyId: json[Delivery_Boy_Id],
        deliverBy: json[DeliverBy]);
  }
}
