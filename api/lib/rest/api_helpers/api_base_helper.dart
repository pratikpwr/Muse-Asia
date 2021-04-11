import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_exception.dart';

class ApiBaseHelper {
  Dio dio = new Dio();

  Future<dynamic> get(String url, {Map<String, dynamic> parameters}) async {
    debugPrint('Url : $url');
    var responseJson;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      final response = await dio.get(url, queryParameters: parameters ?? '');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    var responseJson;
    try {
      final response = await dio.post(url, data: data);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    var responseJson;
    try {
      final response = await dio.put(url, data: data);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, {dynamic data}) async {
    debugPrint('{Url : $url,\nbody: ${data.toString() ?? ""}');
    var responseJson;
    try {
      final response = await dio.delete(url, data: data ?? "");
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return responseJson;
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.data.toString());
      case 400:
        return json.decode(response.data.toString());
      case 401:
      case 403:
        return json.decode(response.data.toString());
      case 500:
      default:
        return FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
