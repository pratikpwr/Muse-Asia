import 'package:api/rest/api_helpers/api_base_helper.dart';

class RestApiHandlerData {
  static ApiBaseHelper _apiBaseHelper = ApiBaseHelper();

  static getData(String path, {Map<String, dynamic> parameters}) async {
    final response = await _apiBaseHelper.get(path, parameters: parameters);
    return response;
  }

  static postData(String path, dynamic body) async {
    final response = await _apiBaseHelper.post(path, body);
    return response;
  }

  static putData(String path, dynamic body) async {
    final response = await _apiBaseHelper.put(path, body);
    return response;
  }

  static deleteData(String path, {dynamic body}) async {
    final response = await _apiBaseHelper.delete(path, data: body ?? '');
    return response;
  }
}
