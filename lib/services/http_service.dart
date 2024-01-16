import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:task/constants/key_constants.dart';

enum Method { get, post }

class HttpService {
  var dio = Dio();
  Response? response;
  Map<String, String> headers = {};

  request(
      {required String url,
      required Method method,
      Map<String, dynamic>? body,
      bool? isDebug}) async {
    isDebug ??= false;
    if (body != null) {
      if (isDebug) {
        log('Api: ' + url + '\n  body: ' + jsonEncode(body) + '\n ');
      }
    }

    try {
      dio.options.headers = {
        "key": KeyConstants.apiKey,
        "Accept": "application/vnd.api+json",
        "Content-Type": "application/vnd.api+json",
        "Authorization": KeyConstants.authToken
      };
      if (method == Method.post) {
        response = await dio.post(url, data: body);
      } else {
        response = await dio.get(url, queryParameters: body);
      }

      if (response!.statusCode == 200) {
        if (isDebug) {
          log('Api: ' +
              url +
              '\n  body: ' +
              '\n  response: ' +
              jsonEncode(body) +
              jsonEncode(response!.data) +
              '\n ');
        }

        return response;
      } else {
        if (isDebug) {
          log('Api: ' + url + 'Exception: Something went wrong');
        }
        throw Exception("Something went wrong");
      }
    } on DioError catch (e) {
      if (isDebug) {
        log('Api: ' + url + 'Exception: $e');
      }
      throw e.response?.data["failReason"];
    } catch (e) {
      if (isDebug) {
        log('Api: ' + url + 'Exception: Something went wrong');
      }
      if (isDebug) {
        log('Api: ' + url + '/n' + 'body: ' + body.toString());
      }
      print(e);
      throw Exception("Something went wrong");
    }
  }
}
