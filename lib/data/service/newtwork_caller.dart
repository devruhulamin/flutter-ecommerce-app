import 'dart:convert';
import 'package:crafty_bay_ruhulaminjr/data/model/nework_response.dart';
import 'package:crafty_bay_ruhulaminjr/presentation/state/auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  Future<NetworkResponse> getRequiest(
      {required String url, String? token}) async {
    final authToken = Get.find<AuthController>().getToken();
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'token': '${token ?? authToken}',
        'content-type': 'application/json'
      });
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
            responseData: decodedResponse,
            errorMessage: decodedResponse['data'] ?? 'Something went wrong',
          );
        }
      } else if (response.statusCode == 401) {
        await Get.find<AuthController>().logOut();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: null,
            errorMessage: 'Something went wrong');
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: null,
            errorMessage: 'Something went wrong');
      }
    } catch (e) {
      throw Exception('Something Went Wrong');
    }
  }

  Future<NetworkResponse> postRequiest(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    try {
      final authToken = Get.find<AuthController>().getToken();
      final response = await http.post(Uri.parse(url),
          headers: {
            'token': '${token ?? authToken}',
            'Content-Type': 'application/json'
          },
          body: jsonEncode(body));
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
            responseData: decodedResponse,
            errorMessage: decodedResponse['data'] ?? 'Something went wrong',
          );
        }
      } else if (response.statusCode == 401) {
        await Get.find<AuthController>().logOut();
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: null,
            errorMessage: 'Something went wrong');
      } else {
        return NetworkResponse(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: null,
            errorMessage: 'Something went wrong');
      }
    } catch (e) {
      throw Exception('Something Went Wrong');
    }
  }
}
