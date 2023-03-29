class OrderDetailsResponse {
  OrderDetailsResponse({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final bool status;
  late final OrderDetailsData data;

  OrderDetailsResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = OrderDetailsData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.toJson();
    return _data;
  }
}

class OrderDetailsData {
  OrderDetailsData({
    required this.id,
    required this.sku,
    required this.sender,
    required this.senderAddress,
    required this.paymentMethod,
    required this.shipmentItemType,
    required this.recieverName,
    required this.recieverPhone,
    required this.receiverAddress,
    required this.amount,
    required this.date,
    required this.status,
  });
  late final int id;
  late final String sku;
  late final String sender;
  late final String senderAddress;
  late final String paymentMethod;
  late final String shipmentItemType;
  late final String recieverName;
  late final String recieverPhone;
  late final String receiverAddress;
  late final int amount;
  late final String date;
  late final String status;

  OrderDetailsData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sku = json['sku'];
    sender = json['sender'];
    senderAddress = json['sender_address'];
    paymentMethod = json['payment_method'];
    shipmentItemType = json['shipment_item_type'];
    recieverName = json['reciever_name'];
    recieverPhone = json['reciever_phone'];
    receiverAddress = json['receiver_address'];
    amount = json['amount'];
    date = json['date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sku'] = sku;
    _data['sender'] = sender;
    _data['sender_address'] = senderAddress;
    _data['payment_method'] = paymentMethod;
    _data['shipment_item_type'] = shipmentItemType;
    _data['reciever_name'] = recieverName;
    _data['reciever_phone'] = recieverPhone;
    _data['receiver_address'] = receiverAddress;
    _data['amount'] = amount;
    _data['date'] = date;
    _data['status'] = status;
    return _data;
  }
}