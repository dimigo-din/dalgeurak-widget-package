import 'dart:convert';

import 'package:dalgeurak_widget_package/services/shared_preference.dart';
import 'package:dalgeurak_widget_package/widgets/toast.dart';
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

class DalgeurakStudentListAPI {
  DalgeurakService _dalgeurakService = DalgeurakService();
  DalgeurakToast _dalgeurakToast = DalgeurakToast();
  DateTime nowTime = DateTime.now();

  getStudentList(bool isMust) async {
    String? stringData = SharedPreference().getStudentList();
    int weekFirstDay = (nowTime.day - (nowTime.weekday - 1));

    if (isMust || stringData == null || (json.decode(stringData))["weekFirstDay"] != _dalgeurakService.getCorrectDate(weekFirstDay)['day']) {
      Map data = await _dalgeurakService.getAllStudentListInDimigoin();

      if (data['success']) {
        SharedPreference().saveStudentList({"studentList": data['content'], "weekFirstDay":  _dalgeurakService.getCorrectDate(weekFirstDay)['day']});
        return data['content'];
      } else {
        _dalgeurakToast.show(data['content']);
      }
    } else {
      List originalData = (json.decode(stringData))['studentList'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(DimigoinUser.fromJson(element)));

      return formattingData;
    }
  }
}