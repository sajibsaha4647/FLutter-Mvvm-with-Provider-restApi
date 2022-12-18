import 'package:flutter/material.dart';
import 'package:fluttermvvm/Repository/Auth_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:provider/provider.dart';
import '../../Data/Response/ApiResponse.dart';
import '../../Model/loginModel.dart';
import '../../Utils/GeneralUtils/Utils.dart';
import '../SharepreferenceViewmodel/SharepreferenceViewModel.dart';

class AuthViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _registerloading = false;
  bool get registerloading => _registerloading;

  setregisterloading(bool value) {
    _registerloading = value;
    notifyListeners();
  }

  ApiResponse<LoginModel> getLoginData = ApiResponse.loading();

  setLoginResponse(ApiResponse<LoginModel> response) {
    getLoginData = response;
    notifyListeners();
  }

  Future<void> loginApi(context, data) async {
    final userPreference =
        Provider.of<SharepreferenceViewModel>(context, listen: false);
    final bool isValid = EmailValidator.validate(data['email']);
    if (data['email'].isEmpty || data['password'].isEmpty) {
      Utils.flashbarMethod("Email filed is required", context);
    } else if (!isValid) {
      Utils.flashbarMethod("Invalid email address", context);
    } else if (data['password'].length <= 5) {
      Utils.flashbarMethod("Password minimum 6 char ", context);
    } else {
      setloading(true);
      _authrepo.LoginApi(data)
          .then((value) => {
                setloading(false),
                userPreference.SaveUserInfo(value),
                // userPreference.SaveUserInfo(
                //     LoginModel(token: value['token'].toString())),
                debugPrint(value.toString())
              })
          .onError((error, stackTrace) => {
                debugPrint(error.toString()),
                setloading(false),
                Utils.flashbarMethod("$error", context)
              });
    }
  }

  Future<void> RegisterApi(context, data) async {
    final bool isValid = EmailValidator.validate(data['email']);
    if (data['email'].isEmpty || data['password'].isEmpty) {
      Utils.flashbarMethod("Email filed is required", context);
    } else if (!isValid) {
      Utils.flashbarMethod("Invalid email address", context);
    } else if (data['password'].length <= 5) {
      Utils.flashbarMethod("Password minimum 6 char ", context);
    } else {
      setregisterloading(true);
      _authrepo.Register(data)
          .then((value) => {
                setregisterloading(false),
                Utils.Snackbar("Account created successfully", context),
                Navigator.pushReplacementNamed(context, RoutesName.login),
                debugPrint(value.toString())
              })
          .onError((error, stackTrace) => {
                debugPrint(error.toString()),
                setregisterloading(false),
                Utils.flashbarMethod("$error", context)
              });
    }
  }
}
