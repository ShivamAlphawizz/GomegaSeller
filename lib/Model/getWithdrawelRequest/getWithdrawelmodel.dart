import 'package:eshopmultivendor/Helper/String.dart';
import 'package:intl/intl.dart';

class GetWithdrawelReq {
  String? id,
      userId,
      paymentType,
      paymentAddress,
      amountRequested,
      remarks,
      status,
      dateCreated;

  GetWithdrawelReq({
    this.id,
    this.userId,
    this.paymentType,
    this.paymentAddress,
    this.amountRequested,
    this.remarks,
    this.status,
    this.dateCreated,
  });
  factory GetWithdrawelReq.fromJson(Map<String, dynamic> json) {
    return GetWithdrawelReq(
      id: json[Id],
      userId: json[UserId],
      paymentType: json[PaymentType],
      paymentAddress: json[PaymentAddress],
      amountRequested: json[AmountRequested],
      remarks: json[Remarks],
      status: json[Status],
      dateCreated: json[DateCreated],
    );
  }
  factory GetWithdrawelReq.fromReqJson(Map<String, dynamic> json) {
    String date = json[DateCreated];

    date = DateFormat('dd-MM-yyyy').format(DateTime.parse(date));
    String? st = json[Status];
    if (st == "0") {
      st = PENDIND;
    } else if (st == "1") {
      st = ACCEPTED;
    } else if (st == "2") {
      st = REJECTED;
    }
    return GetWithdrawelReq(
      id: json[Id],
      amountRequested: json[AmountRequested],
      status: st,
      dateCreated: date,
      userId: json[UserId],
      paymentType: json[PaymentType],
      paymentAddress: json[PaymentAddress],
      remarks: json[Remarks],
    );
  }
}
