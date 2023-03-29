import 'package:get/get.dart';


class LoggerController extends GetxController implements GetxService {
/*
  var mainLogger = List<LoggerModelData>.empty(growable: true).obs;
  AppDatabase database = LocalService().getDatabase();

  saveLog(String link, int statsCode,
      {loggerRespSendTime = 0,
      response = "",
      isTimeOut = false,
      reqType = "GET"}) {
    DateTime time = DateTime.now();
    var startTime = time.millisecondsSinceEpoch;

    var model = LoggerModelData(
        carId: 1,
        link: link,
        statsCode: statsCode,
        requestTime: loggerRespSendTime.toString(),
        responseTime: startTime.toString(),
        response: response,
        isTimeOut: isTimeOut,
        reqType: reqType);
    database.insertLogger(model);
  }


  getAllLogger() async {
    var list = await database.getAllLoggerData();
    print(list);

    mainLogger.assignAll(list);
    mainLogger.reversed;
    print("data ${list.length}");
  }

  deleteAll() async {
    mainLogger.clear();
    await database.deleteAllLogger();
  }
  */

}
