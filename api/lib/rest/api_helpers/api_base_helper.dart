import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_exception.dart';

class ApiBaseHelper {
  Dio dio = new Dio();

  Future<Response> get(String url) async {
    debugPrint('Url : $url ');

    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      response = await dio.get(url);
      debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> post(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    Response response;
    try {
      response = await dio.post(url, data: data);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> put(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    Response response;
    try {
      response = await dio.put(url, data: data);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> delete(String url, {dynamic data}) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    Response response;
    try {
      response = await dio.delete(url, data: data);
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
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
