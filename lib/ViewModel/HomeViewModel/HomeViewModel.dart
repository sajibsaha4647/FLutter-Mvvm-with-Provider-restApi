import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../Data/Response/ApiResponse.dart';
import '../../Model/UserListModel.dart';
import '../../Repository/HomeRepository.dart';
import '../../Utils/GeneralUtils/Utils.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  bool _loading = false;
  bool get loading => _loading;

  setHomeloading(bool val) async {
    _loading = val;
    notifyListeners();
  }

  ApiResponse<UserListModel> getUserListData = ApiResponse.loading();

  setUserListResponse(ApiResponse<UserListModel> response) {
    getUserListData = response;
    notifyListeners();
  }

  ApiResponse<UserListModel> historyleaveData = ApiResponse.loading();

  setLResponse(ApiResponse<UserListModel> response) {
    historyleaveData = response;
    notifyListeners();
  }

  Future getUserListApi(context) async {
    setHomeloading(true);
    _homeRepo
        .getUserListApi()
        .then((value) => {
              setHomeloading(false),
      setLResponse(ApiResponse.completed(value)),
            })
        .onError((error, stackTrace) => {
              setHomeloading(false),
              Utils.Toasts("$error")
            });
  }
}
