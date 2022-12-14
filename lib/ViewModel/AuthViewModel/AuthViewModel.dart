import 'package:flutter/material.dart';
import 'package:fluttermvvm/Repository/Auth_repository.dart';
import 'package:email_validator/email_validator.dart';
import '../../Utils/GeneralUtils/Utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authrepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(context, data) async {
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
          .then((value) => {setloading(false), debugPrint(value.toString())})
          .onError((error, stackTrace) => {
                debugPrint(error.toString()),
                setloading(false),
                Utils.flashbarMethod("$error", context)
              });
    }
  }
}
