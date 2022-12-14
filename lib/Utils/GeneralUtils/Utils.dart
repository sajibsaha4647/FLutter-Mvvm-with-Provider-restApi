import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {

  static Toasts(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        backgroundColor: Colors.deepOrange,
        toastLength: Toast.LENGTH_LONG,
        textColor: Colors.white);
  }

//adding flash bar here
  static void flashbarMethod(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.all(15),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 10,
          icon: Icon(
            Icons.error,
            size: 25,
            color: Colors.white,
          ),
          message: message,
          title: "mvvm",
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.pinkAccent,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  //add flutter snackbar
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Snackbar(
      String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  static fiedlFocuschange (BuildContext context, FocusNode current , FocusNode nextfocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextfocus) ;
  }

}