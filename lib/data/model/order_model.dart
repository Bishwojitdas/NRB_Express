class OrdersModel{
int? trackId;
String? senderName;
String? paymentType;
String? receiverName;
String? receiverAddress;
String? receiverPhone;
String? orderDate;
String? orderType;
String? orderStatus;

OrdersModel({
      this.trackId,
      this.senderName,
      this.paymentType,
      this.receiverName,
      this.receiverAddress,
      this.receiverPhone,
      this.orderDate,
      this.orderType,
      this.orderStatus});
}