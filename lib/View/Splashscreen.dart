import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvvm/Utils/Routes/RoutesName.dart';
import 'package:fluttermvvm/View/HomeScreen.dart';
import 'package:fluttermvvm/View/LoginScreen.dart';
import 'package:fluttermvvm/ViewModel/AuthViewModel/AuthViewModel.dart';
import 'package:provider/provider.dart';

import '../Data/Response/ApiResponse.dart';
import '../ViewModel/SharepreferenceViewmodel/SharepreferenceViewModel.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  final GlobalKey<ScaffoldState> _key = GlobalKey();

  Getlogincheck(context)async{
    final userPreference = Provider.of<SharepreferenceViewModel?>(context,listen: false);
    final userLoginProvider = Provider.of<AuthViewModel?>(context,listen: false);

    userPreference?.GetUserInfo().then((value){
      print(value);
      if(value != null){
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, RoutesName.home);
          userLoginProvider?.setLoginResponse(ApiResponse.completed(value));
        });
      }else{
        Timer(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, RoutesName.login);
          userLoginProvider?.setLoginResponse(ApiResponse.loading());
        });
      }
    }).onError((error, stackTrace){
      print("error");
      print(error.toString());
    });
  }


  @override
  void initState() {
    Getlogincheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.cyan,
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
        child: Scaffold(
      key: _key, // Assign the key to Scaffold.
      drawer: const Drawer(),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MvvM",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.w,
            ),
            SizedBox(
              height: 20.w,
            ),
            const CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.amber,
            )
          ],
        ),
      ),
    ));
  }
}
