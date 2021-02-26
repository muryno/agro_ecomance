// import 'dart:ui';
import 'package:agro_ecomance/entity/responds/bankVerification.dart';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../RaisedGradientButton.dart';
import '../helper.dart';
import 'package:dio/dio.dart';


class BankDialogBox extends StatefulWidget {


  final  BuildContext context;

  const BankDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _BankDialogBox createState() => _BankDialogBox();
}

class _BankDialogBox extends State<BankDialogBox> {

  var _accountNumber = TextEditingController();
  var _accountName = TextEditingController();
  var _bankName = TextEditingController();



  @override
  void initState() {


    StorageUtil.getBankDetails().then((value) =>
    {
      if (value != null){

        setState(() {

          _accountNumber.text = value.account_number.toString();
          _accountName.text = value.account_name.toString();
          _bankName.text = value.bank_name.toString();
        })
      }
    }

    );

    super.initState();
  }





  @override
  Widget build(BuildContext context) {



    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }



  contentBox(context) {

    Widget accountNumber = Container(
        child: TextFormField(
          onChanged: (data){

            if (data.length == 10){
              verifyBank(data,context);
            }
          },

          controller: _accountNumber,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Account number',label: 'Account number'),
          keyboardType: TextInputType.emailAddress,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Account number ';
            }
            return null;
          },
        )
    );


    Widget accountName = Container(
        child: TextFormField(
          controller: _accountName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Account name',label: 'Account name'),
          keyboardType: TextInputType.text,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Account name ';
            }
            return null;
          },
        )
    );

    Widget bankName = Container(
        child: TextFormField(
          controller: _bankName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Bank Name',label: 'Bank Name'),
          keyboardType: TextInputType.emailAddress,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your bankName';
            }
            return null;
          },
        )
    );

    final formKey = GlobalKey<FormState>();


    return Center(
      child:    Form(
        key: formKey,
        child: Container(
        height: 700,
        width: MediaQuery.of(context).size.width-80,

        padding: EdgeInsets.only(
            left: Constants.padding,
            top: Constants.padding,
            right: Constants.padding,
            bottom: Constants.padding),
        margin: EdgeInsets.only(top: Constants.avatarRadius),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        child: Stack(
          children: [

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child:  Column(


                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  SizedBox(height: 25,),

                  InkWell(
                    child:    Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    onTap: (){
                      Navigator.of(context).pop();

                    },
                  ),
                  SizedBox(height: 30,),



                  Container(
                      padding: EdgeInsets.only(top: 40,bottom: 15),
                      child:  Text("Bank Information",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                  ),

                  SizedBox(height: 15,),
                  accountNumber,
                  SizedBox(height: 15,),
                  accountName,
                  SizedBox(height: 15,),
                  bankName,

                  SizedBox(height: 35,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: RaisedGradientButton(
                        child: Text(
                          'Save change',
                          style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){
                          if (formKey.currentState.validate()) {
                            settingsBloc.addsBank( this._accountName.text, this._accountNumber.text,this._bankName.text, context);

                          }

                        }
                    ),
                  ),






                  SizedBox(
                    height: 20,
                  ),

                ],

              ),
            ),

          ],
        )
      ),
      )
    );
  }


  verifyBank(String acctNum, BuildContext context) async {







    Helper.startLoading(context);
    try {

      Dio dio = new Dio();


      dio.options.responseType = ResponseType.json;
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true, request: true, error: true));
      dio.get("https://app.nuban.com.ng/api/NUBAN-OGRNOTZN399?acc_no=$acctNum")
          .then((value)=> onResponds(value.data,context))
          .catchError(onError);

      //  RetrofitClientInstances.getInstance().getDataService().uploadGalleryImages( multipart).then((value)=>onResponds(value,type,context)).catchError(onError);

    }catch(e){

      Helper.loadingFailed(e.toString());

    }


  }


  onResponds(List< dynamic> data, BuildContext context) {
    var snapshot = BankVerification.fromJson(data[0]);


    Helper.loadingSuccessful("");
    _accountName.text  = snapshot.account_name;
    _accountNumber.text  = snapshot.account_number;
    _bankName.text  = snapshot.bank_name;

  }

  onError(e) {
    //var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed("Can't retrive bank details");
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
