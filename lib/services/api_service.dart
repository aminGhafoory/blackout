import 'dart:convert';
import 'package:blackout/models/blackout.dart';
import 'package:dio/dio.dart';
import 'package:shamsi_date/shamsi_date.dart';

class ApiService {
  Future<OutageReport?> getOutage(int billId, String token) async {
    final dio = Dio();

    final url = 'https://uiapi2.saapa.ir/api/ebills/PlannedBlackoutsReport';

    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';
    dio.options.headers['User-Agent'] =
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0';
    dio.options.headers['Authorization'] = token;
    dio.options.headers['Connection'] = 'keep-alive';
    dio.options.headers['Sec-Fetch-Dest'] = 'empty';
    dio.options.headers['Sec-Fetch-Mode'] = 'cors';
    dio.options.headers['Sec-Fetch-Site'] = 'cross-site';
    dio.options.headers['Accept'] = 'application/json, text/plain, */*';
    dio.options.headers['Origin'] = 'cross-site';
    dio.options.headers['Sec-Fetch-Site'] = 'https://bargheman.com';
    dio.options.headers['Referer'] = 'https://bargheman.com/';

    final today = Jalali.now();
    final threeDaysLater = today.addDays(3);

    final data = {
      'bill_id': '$billId',
      'from_date':
          '${today.formatter.yyyy}/${today.formatter.mm}/${today.formatter.dd}',
      'to_date':
          '${threeDaysLater.formatter.yyyy}/${threeDaysLater.formatter.mm}/${threeDaysLater.formatter.dd}'
    };

    try {
      final response = await dio.post(url, data: data);

      if (response.statusCode != 200) {
        throw DioException.badResponse(
            statusCode: response.statusCode ?? 0,
            requestOptions: RequestOptions(),
            response: response);
      }

      final result = response.data as Map<String, dynamic>;

      return OutageReport.fromJson(result);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<OutageReport?> mockGetOutage() async {
    final json = '''{
  "TimeStamp": "2024-12-16T15:30:59.399037493+03:30",
  "status": 200,
  "SessionKey": "3abaf75c-4329-410f-afa4-82eef70156dc",
  "message": "تعداد 1 خاموشی یافت شد",
  "data": [
    {
      "reg_date": "1403/09/26",
      "registrar": "عليزاده",
      "reason_outage": "مديريت بار",
      "outage_date": "1403/09/27",
      "outage_time": "09:00",
      "outage_start_time": "09:00",
      "outage_stop_time": "10:30",
      "is_planned": true,
      "address": "فيدر هاي 1 و 2 و 3",
      "outage_address": "فيدر هاي 1 و 2 و 3",
      "city": 15,
      "outage_number": 40215226867,
      "tracking_code": 402151072426
    },
    {
      "reg_date": "1403/09/26",
      "registrar": "عليزاده",
      "reason_outage": "مديريت بار",
      "outage_date": "1403/09/27",
      "outage_time": "09:00",
      "outage_start_time": "09:00",
      "outage_stop_time": "10:30",
      "is_planned": true,
      "address": "فيدر هاي 1 و 2 و 3",
      "outage_address": "فيدر هاي 1 و 2 و 3",
      "city": 15,
      "outage_number": 40215226867,
      "tracking_code": 402151072426
    },
    {
      "reg_date": "1403/09/26",
      "registrar": "عليزاده",
      "reason_outage": "مديريت بار",
      "outage_date": "1403/09/27",
      "outage_time": "09:00",
      "outage_start_time": "09:00",
      "outage_stop_time": "10:30",
      "is_planned": true,
      "address": "فيدر هاي 1 و 2 و 3",
      "outage_address": "فيدر هاي 1 و 2 و 3",
      "city": 15,
      "outage_number": 40215226867,
      "tracking_code": 402151072426
    }
  ],
  "error": null
}''';
    final result = jsonDecode(json) as Map<String, dynamic>;
    return Future.delayed(Duration(milliseconds: 200), () {
      return OutageReport.fromJson(result);
    });
  }
}
