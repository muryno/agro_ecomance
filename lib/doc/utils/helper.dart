import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';




import 'package:progress_dialog/progress_dialog.dart';


import 'dart:async';


import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;

import 'dimens.dart';




class Helper {





  static Widget progressWidget(GlobalKey progressKey) {
    return Container(
        height: Dimens.px56,
        child: Center(
          child: CircularProgressIndicator(
            key: progressKey,
          ),
        ));
  }




  static ProgressDialog _progressDialog;

  static void startLoading(BuildContext context, [String message = "Please wait..."]){
    if(_progressDialog != null && _progressDialog.isShowing()) _progressDialog.hide();

    _progressDialog = ProgressDialog(context, isDismissible: false,);
    _progressDialog.update(message: message);
    _progressDialog.show();
  }


  static void loadingSuccessful(String message){
    if(_progressDialog != null && _progressDialog.isShowing()) _progressDialog.hide().then((isHidden){
      toastSuccess(message);
    });

  }

  static void loadingFailed(String message){
    if(_progressDialog != null && _progressDialog.isShowing()) _progressDialog.hide().then((isHidden){
      toastError(message);

    });
    _progressDialog.hide();
  }

  static void showMessage(String message, Color colors) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: colors,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }



  static void toastSuccess(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.green, textColor: Colors.white);
  }

  static void toastInfo(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.blue, textColor: Colors.white, );
  }

  static void toastError(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.BOTTOM, backgroundColor: Colors.red, textColor: Colors.white);
  }





}
