class OrderStatusResponse {
  OrderStatusResponse({
    required this.message,
    required this.status,
    required this.data,
  });
  late final String message;
  late final bool status;
  late final List<OrderStatusData> data;

  OrderStatusResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    status = json['status'];
    data = List.from(json['data']).map((e)=>OrderStatusData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class OrderStatusData {
  OrderStatusData({
    required this.name,
    required this.value,
  });
  late final String name;
  late final String value;

  OrderStatusData.fromJson(Map<String, dynamic> json){
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['value'] = value;
    return _data;
  }
}