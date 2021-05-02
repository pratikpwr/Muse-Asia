import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_exception.dart';

class ApiBaseHelper {
  Dio dio = new Dio();

  Future<Response> get(String url) async {
    debugPrint('Url : $url ');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token') ?? "";

    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      // dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.get(url);
      // debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> post(String url, dynamic data) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token') ?? "";

    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.post(
        url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );
      debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> put(String url, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token') ?? "";

    debugPrint('{Url : $url,\nbody: ${data.toString()}');
    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      response = await dio.put(
        url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );
      debugPrint(response.data.toString());
    } on SocketException {
      throw FetchDataException('No Internet connection.');
    }
    return response;
  }

  Future<Response> delete(String url, {dynamic data}) async {
    debugPrint('{Url : $url,\nbody: ${data.toString()}');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('Token') ?? "";

    Response response;
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
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
