import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fluttermvvm/Data/AppException.dart';
import 'package:fluttermvvm/Data/Network/BaseApiService.dart';
import 'package:http/http.dart';

class NetworkApiservice extends BaseApiService {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connectoin");
    }

    return responseJson;
  }

  @override
  Future postPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connectoin");
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException("Invalid request ${response.body}");
      case 500:
        throw UnauthorizedException("Server error ${response.body}");
      case 404:
        throw UnauthorizedException("Unauthorized ${response.body}");
      default:
        throw FetchDataException(
            "Communication problem with server ${response.statusCode}");
    }
  }
}
