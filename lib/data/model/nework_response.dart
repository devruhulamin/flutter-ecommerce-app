class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final String? errorMessage;
  final dynamic responseData;

  NetworkResponse(
      {required this.isSuccess,
      required this.statusCode,
      this.errorMessage,
      required this.responseData});
}
