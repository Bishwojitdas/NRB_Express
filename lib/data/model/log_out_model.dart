class LogOut {
  LogOut({
    required this.error,
    required this.message,
  });
  late final int error;
  late final String message;

  LogOut.fromJson(Map<String, dynamic> json){
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['error'] = error;
    _data['message'] = message;
    return _data;
  }
}