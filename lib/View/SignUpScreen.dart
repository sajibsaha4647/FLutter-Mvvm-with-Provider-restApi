import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/Components/RoundedButton.dart';
import '../Utils/GeneralUtils/Utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  bool obsecure = true;

  FocusNode emailfocusnode = FocusNode();
  FocusNode passwordfocusnode = FocusNode();

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    emailfocusnode.dispose();
    passwordfocusnode.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.cyan,
            centerTitle: true,
            title: Text("SignUp"),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                  focusNode: emailfocusnode,
                  onFieldSubmitted: (val){
                    Utils.fiedlFocuschange(context,emailfocusnode,passwordfocusnode);
                  },
                  decoration: const InputDecoration(
                      fillColor: Colors.black,
                      hoverColor: Colors.black,
                      hintText: "Enter your email",
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.alternate_email)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.black),
                  focusNode: passwordfocusnode,
                  onFieldSubmitted: (val){
                    // Utils.fiedlFocuschange(context,passwordfocusnode ,emailfocusnode);
                  },
                  obscureText: obsecure,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: "Enter your password",
                    label: Text("Password"),
                    prefixIcon:Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon:obsecure ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          obsecure = !obsecure;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RoundedButton(context,() {
                  var data = {
                    "email":_emailcontroller.text,
                    "password":_passwordcontroller.text
                  };
                  // authviewmodel.loginApi(context, data);
                },"Login",  false),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  child: InkWell(
                    onTap: (){

                    },
                    child: Text("Don't have account? Signup",style: TextStyle(color: Colors.black),),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
