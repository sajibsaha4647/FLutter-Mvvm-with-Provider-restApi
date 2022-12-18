
import '../Data/Network/BaseApiService.dart';
import '../Data/Network/NetworkService.dart';
import '../Model/UserListModel.dart';
import '../Resources/ApiService.dart';

class HomeRepository {

  BaseApiService baseApiService = NetworkApiservice();

  Future<UserListModel>getUserListApi()async{
    try{

      dynamic response = await baseApiService.getGetApiResponse(AppUrl.endpointUsers);
      return UserListModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }

}