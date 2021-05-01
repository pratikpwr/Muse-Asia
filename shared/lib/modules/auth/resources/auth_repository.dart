import 'package:api/main.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  Future<Response> signIn({String email, String password}) async {
    Response response = await ApiSdk.signIn(email: email, password: password);
    return response;
  }

  Future<Response> signUp(
      {String userName, String email, String password}) async {
    Response response = await ApiSdk.signUp(
        userName: userName, email: email, password: password);
    return response;
  }
}
