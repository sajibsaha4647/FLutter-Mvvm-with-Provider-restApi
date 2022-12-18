import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttermvvm/Model/loginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;


class SharepreferenceViewModel with ChangeNotifier{


  Future<bool> SaveUserInfo(LoginModel user) async {

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString("userinfo",jsonEncode(user));
    notifyListeners();
    return true;
  }

  Future<LoginModel?> GetUserInfo() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    var todoString = sp.getString('userinfo');
    if (todoString != null) {
      var json =  convert.jsonDecode(todoString);
      return LoginModel.fromJson(json);
    }

  }


  Future<bool> RemoveUserInfo()async{
    final prefs = await SharedPreferences.getInstance();
    final success = await prefs.remove('userinfo');
    notifyListeners();
    return success ;
  }

  Future<bool> clearSharepreference()async{
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    notifyListeners();
    return true ;
  }


}