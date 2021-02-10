import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    configLoading();
    EasyLoading.show(status: message);
  }


  static void loadingSuccessful(String message){

    EasyLoading.showSuccess(message);
    EasyLoading.showToast(message);
    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    EasyLoading.removeAllCallbacks();

  }

  static void loadingFailed(String message){
    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    EasyLoading.showError(message);

    if( EasyLoading.isShow) {EasyLoading.dismiss();}
    EasyLoading.removeAllCallbacks();

  }



 static void configLoading() {
   EasyLoading.instance
     ..indicatorType = EasyLoadingIndicatorType.cubeGrid
     ..loadingStyle = EasyLoadingStyle.custom
     ..indicatorSize = 45.0
     ..radius = 10.0

     ..userInteractions = false
     ..progressColor = Colors.white
     ..backgroundColor = Colors.black
     ..indicatorColor = Colors.white
     ..textColor = Colors.white
     ..maskColor = Colors.blue.withOpacity(0.5)

     ..dismissOnTap = false
     ..customAnimation = CustomAnimation();

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


class CustomAnimation extends EasyLoadingAnimation {
  CustomAnimation();

  @override
  Widget buildWidget(
      Widget child,
      AnimationController controller,
      AlignmentGeometry alignment,
      ) {
    double opacity = controller?.value ?? 0;
    return Opacity(
      opacity: opacity,
      child: RotationTransition(
        turns: controller,
        child: child,
      ),
    );
  }
}
