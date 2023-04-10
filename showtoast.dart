import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
alertDialog(String msg){
Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM_LEFT,
        timeInSecForIosWeb: 3,
        backgroundColor: const Color(0xFFC87626),
        textColor:  Colors.white,
        fontSize: 16.0
    );
}

validateemail(String email){
  //final emailReg = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_'{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0-253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0-253}[a-zA-Z0-9])?)*$");
  final emailReg = RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_'{|}~-]+@[a-zA-Z0-9]");
  return emailReg.hasMatch(email);
}