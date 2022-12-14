import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttermvvm/View/HomeScreen.dart';
import 'package:fluttermvvm/View/LoginScreen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (_) => const LoginScreen()));
    });
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
