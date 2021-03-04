import 'dart:convert';


import 'package:agro_ecomance/entity/responds/bankDetailResponds.dart';
import 'package:agro_ecomance/entity/responds/bankVerification.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class WithdrawScreen extends StatefulWidget {



  @override
  _Screen34To36State createState() => _Screen34To36State();
}

class _Screen34To36State extends State<WithdrawScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  String _name = "";

  String _usr = "";

  var _bankAccount = TextEditingController();
  var _bankNumber = TextEditingController();
  var _bankName = TextEditingController();
  var _amount = TextEditingController();


  var _bankAccount2 = TextEditingController();
  var _bankNumber2 = TextEditingController();
  var _bankName2 = TextEditingController();
  var _amount2 = TextEditingController();
  BankData _bankData;

  final _formSignInKey = GlobalKey<FormState>();
  String avr ;

  @override
  void initState() {

    StorageUtil.getProfileUser().then((value) {
      if (value != null){

        setState(() {
          _name = '${value.first_name } ${value.last_name }';

          avr = value.avatar_url;

        });


      }

    });


    StorageUtil.getUser().then((value) {
      if (value != null){
        setState(() {
          _usr = '${value.data.client } ';
        });
      }

    });


    StorageUtil.getBankDetails().then((value) =>
    {
      if (value != null){


        setState(() {

          _bankAccount.text = value.account_number.toString();
          _bankNumber.text = value.account_name.toString();
          _bankName.text = value.bank_name.toString();

        })
      }
    }

    );
    super.initState();


  }


  @override
  Widget build(BuildContext context) {




    return Scaffold(
        key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.white,
        actions: [
        ],
      ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Card(
              margin: EdgeInsets.only(bottom: 12.0),
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.8,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Form(
                  key: _formSignInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {

                              Navigator.of(context).pop();
                            },
                          ),
                          Text(
                            "Make Withdrawal",
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0XFF3ABC16),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          )
                        ],
                      ),


                      const SizedBox(
                        height: 20.0,
                      ),
                      ExpansionTile(
                        title: Text("Automatic",style: TextStyle(color: Color(0xff3ABC16))),
                        // backgroundColor:Color(0XFF3ABC16).withOpacity(0.2) ,
                        // trailing: Icon(Icons.arrow_forward_ios, size: 20),
                        children: [

                          TextField(
                            enabled: false,
                            controller: _bankNumber,
                            decoration: InputDecoration(
                              hintText: "00*****76",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),

                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextField(
                            enabled: false,
                            controller: _bankName,
                            decoration: InputDecoration(
                              hintText: "Bank name",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextField(
                            enabled: false,
                            controller: _bankAccount,
                            decoration: InputDecoration(
                              hintText: "Bank account name",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),

                          TextField(
                            keyboardType: TextInputType.number,
                            controller: _amount,
                            decoration: InputDecoration(
                              hintText: "Amount()",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),

                          ButtonTheme(
                            minWidth: double.infinity,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color(0XFF3ABC16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              child: Text("Make Withdrawal"),
                              onPressed: () {

                                if(_amount.text == ""){
                                  Helper.toastError("Enter amount");
                                  return;
                                }
                                if(_bankNumber.text == ""){
                                  Helper.toastError("Enter bank number");
                                  return;
                                }
                                if(_bankAccount.text == ""){
                                  Helper.toastError("Enter bank account");
                                  return;
                                }

                                if(_bankName.text == ""){
                                  Helper.toastError("Enter bank name");
                                  return;
                                }

                             //   earningBloc.attemptWithdraw(int.parse(_amount.text), _bankNumber.text, _bankAccount.text, _bankName.text, context);

                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ExpansionTile(
                        title: Text("Manual",style: TextStyle(color: Color(0xff3ABC16))),
                        // backgroundColor:Color(0XFF3ABC16).withOpacity(0.2) ,
                        children: [

                          TextFormField(

                            onChanged: (data){

                              if (data.length == 10){
                                verifyBank(data,context);
                              }
                            },

                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "00*****76",
                              border: InputBorder.none,
                              filled: true,

                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),
                            ),

                            controller: _bankNumber2,


                            validator: (value){
                              if(value.isEmpty   ){
                                return 'Enter account number';

                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(


                            decoration: InputDecoration(
                              hintText: "Bank name",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),


                            ),

                            controller: _bankName2,

                            validator: (value){
                              if(value.isEmpty   ){
                                return 'Enter bank name';

                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,


                            decoration: InputDecoration(
                              hintText: "Bank account name",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),
                            ),

                            controller: _bankAccount2,

                            validator: (value){
                              if(value.isEmpty   ){
                                return 'Enter account name';

                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),

                          TextFormField(

                            controller: _amount2,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "Amount()",
                              border: InputBorder.none,
                              filled: true,
                              fillColor: Color(0XFFD8D8D8).withOpacity(0.1),
                            ),


                            validator: (value){
                              if(value.isEmpty   ){
                                return 'Enter Amount';

                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),

                          ButtonTheme(
                            minWidth: double.infinity,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color(0XFF3ABC16),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0)),
                              child: Text("Make Withdrawal"),
                              onPressed: () {

                                if (_formSignInKey.currentState.validate()) {
                                 // earningBloc.attemptWithdraw(int.parse(_amount2.text), _bankNumber2.text, _bankAccount2.text, _bankName2.text, context);
                                }

                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),

                    ],
                  ),
                )
                // ],
                // ),
              )),
        ),
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
    _bankAccount2.text  = snapshot.account_name;
    _bankNumber2.text  = snapshot.account_number;
    _bankName2.text  = snapshot.bank_name;

  }

  onError(e) {
    var ad =  jsonDecode(e.response.toString());
    Helper.loadingFailed("Can't retrive bank details");
  }

}
