import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;

import '../exceptions/app_exceptions.dart';
import 'base_api_services.dart';

class NetworkServiceApi implements BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 50));

      return returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeOutException{
      throw TimeOutException('Request Time out');
    }

  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 50));

      return returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeOutException{
      throw TimeOutException('Request Time Out');
    }

  }

  dynamic returnResponse(http.Response response) {
    final decoded = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200:
        return decoded;

      case 400:
        throw BadRequestException(decoded['message'] ?? 'Bad Request');

      case 401:
      case 403:
        throw UnauthorizedException(decoded['message'] ?? 'Unauthorized');

      case 404:
        throw NotFoundException(decoded['message'] ?? 'Not Found');

      case 500:
        throw InternalServerErrorException(decoded['message'] ?? 'Server Error');

      default:
        throw FetchDataException('Status Code: ${response.statusCode}');
    }
  }
}
