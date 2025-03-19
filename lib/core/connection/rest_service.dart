// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:poon_estock_application/core/model/local/file_with_path/file_path_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../main.dart';
import '../init/constants/app/api_endpoints.dart';
import '../init/navigation/navigation.dart';
import '../init/shared_preferences/shared_preferences.dart';
import '../model/api_status/api_status_model.dart';
import '../model/local/file_with_path/file_path_model.dart';
import '../utility/app_alert_dialog.dart';
import '../utility/formatters.dart';
import 'package:http_parser/http_parser.dart';

// final Singleton _singleton = Singleton();

class HeadersService {
  Future<Map<String, String>> headersJson() async {
    // String? tokenApi = await _singleton.getTokenApi();
    // debugPrint('Bearer => $tokenApi');
    Map<String, String> headersJson = {
      'Content-Type': 'application/json',
      // 'Authorization': 'Bearer $tokenApi',
    };
    return headersJson;
  }

  static Map<String, String> headersMultiPart = {
    'Content-Type':
        'multipart/form-data; boundary=<calculated when request is sent>',
    // 'Authorization': 'Bearer $tokenApi',
  };

  static Map<String, String> headersSendOTP = {
    'Content-Type': 'application/json',
    'api_key': 'bdebe606fffc115f7167877fed53d472',
    'secret_key': 'u6enBazEqJ3vfN9S',
  };
}

class RestService {
  static _authen(http.Response response) async {
    if (response.statusCode case (401 || 403)) {
      debugPrint('response.statusCode => ${response.statusCode}');
      debugPrint('response.body => ${response.body}');
      final singleton = Singleton();
      await singleton.clearAll();
      if (navigatorKey.currentContext!.mounted) {
        AppNav.toNameAndRemoveUntil(
          navigatorKey.currentContext!,
          AppNavConstants.LOGIN,
        );
        String textError =
            response.statusCode == 401
                ? 'ไม่ได้รับอนุญาต'
                : 'เซสชันหมดอายุ กรุณาเข้าสู่ระบบใหม่';
        AppAlertDialog.error(
          navigatorKey.currentContext!,
          textError: textError,
        );
      }
      throw response.body;
    }
  }

  static _serverError(http.Response response) async {
    if (response.statusCode case (404)) {
      debugPrint('response.statusCode => ${response.statusCode}');
      debugPrint('response.body => ${response.body}');
      String textError =
          response.statusCode == 404 ? 'Not Found' : 'Internal Server Error';
      throw textError;
    }
  }

  static Future getWithAuthAPI({
    required String urlPath,
    String? endpoint,
    bool print = false,
  }) async {
    try {
      debugPrint(
        'URL_GET: ${endpoint ?? '${ApiEndpoint.instance.endPoint}$urlPath'}',
      );
      var stopwatch = Stopwatch()..start();
      final response = await http.get(
        headers: await HeadersService().headersJson(),
        Uri.parse(endpoint ?? '${ApiEndpoint.instance.endPoint}$urlPath'),
      );
      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        if (print) {
          debugPrint('BODY_DATA: ${printJsonBody(jsonDecode(response.body))}');
        }
        return Success(code: response.statusCode, response: response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw Failure(
          code: response.statusCode,
          errorResponse:
              jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด',
        );
      }
    } on HttpException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on SocketException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on TimeoutException {
      throw Failure(
        code: ApiEndpoint.TIME_OUT,
        errorResponse: ApiEndpoint.MSG_TIME_OUT,
      );
    } catch (e) {
      throw Failure(
        code: e is Failure ? e.code : 500,
        errorResponse: e is Failure ? e.errorResponse : e.toString(),
      );
    }
  }

  static Future putWithAuthAPI({
    required String urlPath,
    Map? bodyData,
    bool noBody = false,
  }) async {
    try {
      debugPrint('URL_PUT: ${ApiEndpoint.instance.endPoint}$urlPath');
      debugPrint('BODY_DATA: ${printJsonBody(bodyData)}');
      var stopwatch = Stopwatch()..start();
      final response = await http.put(
        headers: await HeadersService().headersJson(),
        Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
        body: !noBody ? jsonEncode(bodyData) : null,
      );
      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");
      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        return Success(code: response.statusCode, response: response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw Failure(
          code: response.statusCode,
          errorResponse:
              jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด',
        );
      }
    } on HttpException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on SocketException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on TimeoutException {
      throw Failure(
        code: ApiEndpoint.TIME_OUT,
        errorResponse: ApiEndpoint.MSG_TIME_OUT,
      );
    } catch (e) {
      throw Failure(
        code: e is Failure ? e.code : 500,
        errorResponse: e is Failure ? e.errorResponse : e.toString(),
      );
    }
  }

  static Future postWithAuthAPI({
    required String urlPath,
    Map? bodyData,
    bool noBody = false,
    bool printBody = true,
  }) async {
    try {
      debugPrint('URL_POST: ${ApiEndpoint.instance.endPoint}$urlPath');
      if (printBody) {
        debugPrint('BODY_DATA: ${printJsonBody(bodyData)}');
      }
      var stopwatch = Stopwatch()..start();
      final response = await http.post(
        headers: await HeadersService().headersJson(),
        Uri.parse('${ApiEndpoint.instance.endPoint}$urlPath'),
        body: !noBody ? jsonEncode(bodyData) : null,
      );
      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );

      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        return Success(code: response.statusCode, response: response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw Failure(
          code: response.statusCode,
          errorResponse:
              jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด',
        );
      } else {
        throw Failure(
          code: response.statusCode,
          errorResponse: '( ${response.statusCode} ) ${response.reasonPhrase}',
        );
      }
    } on HttpException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on SocketException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on TimeoutException {
      throw Failure(
        code: ApiEndpoint.TIME_OUT,
        errorResponse: ApiEndpoint.MSG_TIME_OUT,
      );
    } catch (e) {
      throw Failure(
        code: e is Failure ? e.code : 500,
        errorResponse: e is Failure ? e.errorResponse : e.toString(),
      );
    }
  }

  static Future postUploadAWS({required FilePathModel? bodyData}) async {
    try {
      String? fileName = bodyData?.filename;
      if (fileName == null) throw 'ไม่พบชื่อไฟล์';
      String? filePath = bodyData?.filePath;
      if (filePath == null) throw 'ไม่พบไฟล์';
      String? folder = bodyData?.folderName;
      if (folder == null) throw 'ไม่พบโฟลเดอร์ที่จะบันทึกไฟล์';

      debugPrint(
        'URL_POST: ${ApiEndpoint.instance.endPoint}${ApiEndpoint.uploadAws}',
      );
      // String name = (filePath).split('/').last;
      // String extention = name.substring(name.lastIndexOf('.'));
      debugPrint(
        'BODY_DATA: ${printJsonBody({"files": filePath, "folder": folder, "fileName": fileName})}',
      );
      var stopwatch = Stopwatch()..start();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse('${ApiEndpoint.instance.endPoint}${ApiEndpoint.uploadAws}'),
      );
      request.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
      request.files.add(
        await http.MultipartFile.fromPath(
          'files',
          filePath,
          filename: fileName,
          contentType: MediaType('image', 'png'),
        ),
      );

      request.fields['folder'] = folder;
      request.fields['fileName'] = fileName;

      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        debugPrint(response.body);
        return Success(code: response.statusCode, response: response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw Failure(
          code: response.statusCode,
          errorResponse:
              jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด',
        );
      } else {
        throw Failure(
          code: response.statusCode,
          errorResponse: '( ${response.statusCode} ) ${response.reasonPhrase}',
        );
      }
    } on HttpException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on SocketException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on TimeoutException {
      throw Failure(
        code: ApiEndpoint.TIME_OUT,
        errorResponse: ApiEndpoint.MSG_TIME_OUT,
      );
    } catch (e) {
      throw Failure(
        code: e is Failure ? e.code : 500,
        errorResponse: e is Failure ? e.errorResponse : e.toString(),
      );
    }
  }

  static Future postUploadAWSMultiple({
    required FilePathListModel bodyData,
  }) async {
    try {
      String? fileName = bodyData.filename;
      if (fileName == null) throw 'ไม่พบชื่อไฟล์';
      List<FilePathModel> filePathList = bodyData.filePathModel ?? [];
      if (filePathList.isEmpty) throw 'ไม่พบไฟล์';
      String? folder = bodyData.folderName;
      if (folder == null) throw 'ไม่พบโฟลเดอร์ที่จะบันทึกไฟล์';

      debugPrint(
        'URL_POST: ${ApiEndpoint.instance.endPoint}${ApiEndpoint.uploadAwsMultiple}',
      );
      // String name = (filePath).split('/').last;
      // String extention = name.substring(name.lastIndexOf('.'));
      debugPrint(
        'BODY_DATA: ${printJsonBody({"files": filePathList.map((e) => e.filePath).toList(), "folder": folder, "fileName": fileName})}',
      );
      var stopwatch = Stopwatch()..start();
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(
          '${ApiEndpoint.instance.endPoint}${ApiEndpoint.uploadAwsMultiple}',
        ),
      );
      request.headers['Content-Type'] = 'multipart/form-data; charset=utf-8';
      for (var item in filePathList) {
        String? filePath = item.filePath;
        if (filePath != null) {
          request.files.add(
            await http.MultipartFile.fromPath(
              'files',
              filePath,
              filename: fileName,
              contentType: MediaType('image', 'png'),
            ),
          );
        }
      }

      request.fields['folder'] = folder;

      http.StreamedResponse streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      stopwatch.stop();
      ConvertTimeModel time = convertTime(
        stopwatch: stopwatch.elapsedMilliseconds,
      );
      debugPrint("Response Time: ${time.ms} ms OR ${time.s} s");

      await _authen(response);
      await _serverError(response);
      final jsonDe = jsonDecode(response.body);
      if (jsonDe['response_status'] == ApiEndpoint.SUCCESS) {
        debugPrint(response.body);
        return Success(code: response.statusCode, response: response.body);
      } else if (jsonDe['response_status'] == ApiEndpoint.ERROR) {
        throw Failure(
          code: response.statusCode,
          errorResponse:
              jsonDe['message'] ?? jsonDe['error'] ?? 'เกิดข้อผิดพลาด',
        );
      } else {
        throw Failure(
          code: response.statusCode,
          errorResponse: '( ${response.statusCode} ) ${response.reasonPhrase}',
        );
      }
    } on HttpException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on SocketException {
      throw Failure(
        code: ApiEndpoint.NO_INTERNET,
        errorResponse: ApiEndpoint.MSG_NO_INTERNET,
      );
    } on TimeoutException {
      throw Failure(
        code: ApiEndpoint.TIME_OUT,
        errorResponse: ApiEndpoint.MSG_TIME_OUT,
      );
    } catch (e) {
      throw Failure(
        code: e is Failure ? e.code : 500,
        errorResponse: e is Failure ? e.errorResponse : e.toString(),
      );
    }
  }
}

class ConvertTimeModel {
  final int? ms;
  final double? s;

  ConvertTimeModel({this.ms, this.s});
}

ConvertTimeModel convertTime({required int stopwatch}) {
  Duration duration = Duration(milliseconds: stopwatch);
  double seconds = duration.inMilliseconds / (1000);
  return ConvertTimeModel(ms: duration.inMilliseconds, s: seconds);
}
