import 'package:fluttermvvm/Data/Network/BaseApiService.dart';
import 'package:fluttermvvm/Data/Network/NetworkService.dart';
import 'package:fluttermvvm/Resources/ApiService.dart';

class AuthRepository {
  BaseApiService baseApiService = NetworkApiservice();

  Future<dynamic> LoginApi(dynamic data) async {
    try {
      dynamic response =
          await baseApiService.postPostApiResponse(AppUrl.endpointLogin, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> Register(dynamic data) async {
    try {
      dynamic response =
      await baseApiService.postPostApiResponse(AppUrl.endpointLogin, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
