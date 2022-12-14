

import 'package:flutter/material.dart';

import '../Colors.dart';

Widget RoundedButton (context, onpress,title,loading){
  return InkWell(
    onTap: onpress,
    child: Container(
      alignment: Alignment.center,
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: AppColors.blackcolor),
      child: loading
          ? SizedBox(
        height: 30,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      )
          : Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}