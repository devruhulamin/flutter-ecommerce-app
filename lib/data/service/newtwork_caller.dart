import 'dart:convert';

import 'package:crafty_bay_ruhulaminjr/data/model/nework_response.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  Future<NetworkResponse> getRequiest({required String url}) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['msg'] == "success") {
          final result = NetworkResponse(
              isSuccess: true,
              statusCode: response.statusCode,
              responseData: decodedResponse);
          return result;
        } else {
          return NetworkResponse(
              isSuccess: false,
              statusCode: response.statusCode,
              responseData: decodedResponse);
        }
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('Something Went Wrong');
    }
  }

  Future<NetworkResponse> postRequiest(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      final response = await http.post(Uri.parse(url), body: jsonEncode(body));
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse['msg'] == "success") {
          final result = NetworkResponse(
              isSuccess: true,
              statusCode: response.statusCode,
              responseData: decodedResponse);
          return result;
        } else {
          return NetworkResponse(
              isSuccess: false,
              statusCode: response.statusCode,
              responseData: decodedResponse);
        }
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: jsonDecode(response.body));
      }
    } catch (e) {
      throw Exception('Something Went Wrong');
    }
  }
}
