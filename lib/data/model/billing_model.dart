class BillingModel{
  int? trackId;
  int? cod;
  double? xpressFee;
  double? paidAmount;
  String? receiverName;
  String? reciverPhone;
  String? paymentType;
  String? paymentStatus;

  BillingModel(
      {this.trackId,
      this.cod,
      this.xpressFee,
      this.paidAmount,
      this.receiverName,
      this.reciverPhone,
      this.paymentType,
        this.paymentStatus,
  });
}