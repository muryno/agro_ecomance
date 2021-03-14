
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/entity/responds/loginToken.dart';
import 'package:agro_ecomance/rxbloc_pattern/cartPayment_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/payment/create_access.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:local_auth/local_auth.dart';

import 'cart_screen_details.dart';





enum PaymentType{
   CARD,
  PAYCODE,
  EWALLET

}



class  PayOutScreen extends StatefulWidget{

 final List<dynamic> snapshotData;
 PayOutScreen({this.snapshotData});

  @override
  _PayOutScreen createState()  =>  _PayOutScreen();

}


class _PayOutScreen extends State<PayOutScreen>{

  final progressKey = GlobalKey();

  var paycode = TextEditingController();


  bool showText = false;

  int count = 0;
  bool isGeneratingCode = false;

  String reference_id;
  String Sub_id;
  String email;
  String amount = "5000";

  List<CartDataa>   snapshotDta;
  DeliveryAddres  deliveryAddres;


  PaymentType chosenPayCode =   PaymentType.CARD;


  loginToken _token;
  @override
  void initState() {

    snapshotDta  =  widget.snapshotData[0];
    deliveryAddres  =   widget.snapshotData[1];

    snapshotDta.forEach((element) { price  +=( int.parse(element.price ) * element.quantity );

    });

    amount = price.toString();

    
    StorageUtil.getUser().then((value) {
      if (value != null) {
        _token = value;
      }
 });



    PaystackPlugin.initialize(
        publicKey: UrlConstant.PAYSTACK_PUBLIC_KEY);

    StorageUtil.getProfileUser().then((value){
      this.email = value.email;
    });



    super.initState();
  }
  //List<dynamic> snapshotData = [];
  final formKey = GlobalKey<FormState>();

  var price = 0;
  var discount = 0;


  @override
  Widget build(BuildContext context) {



    final size = MediaQuery
        .of(context)
        .size;










    return Scaffold(


      body:   Container (
          width: size.width,
          height: size.height,
          margin: EdgeInsets.only(top: 10,left: 16,right: 16),

          child: Column(

            children: [

              SizedBox(height: 35,),

              Row(
                children: [

                  InkWell(
                    child:    Icon(
                      Icons.arrow_back_outlined,

                      size: 25,
                    ),
                    onTap: (){
                      Navigator.of(context).pop();

                    },
                  ),
                ],
              ),

              SizedBox(height: 10,),

              Text("Payment",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsRegular' ,fontSize: 25),),



              SizedBox(height: 10,),





              Text("Select Payment Method",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 16),),

              DropdownButtonFormField(

                isDense: true,
                hint: new Text('Choose Payment type',
                    textAlign: TextAlign.center),
                items:["Card Payment","E-Wallet","Paycode"].map((value) {
                  return DropdownMenuItem<String>(

                    value: value.toString(),
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
//PaymentType

                  switch(value){
                    case "Card Payment":
                      setState(() {
                      chosenPayCode = PaymentType.CARD;
                    });  break;
                    case "E-Wallet": setState(() {
                      chosenPayCode = PaymentType.EWALLET;
                    });  break;
                    case "Paycode":setState(() {
                      chosenPayCode = PaymentType.PAYCODE;
                    });  break;
                  }

                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0XFFD8D8D8).withOpacity(0.2),
                ),
              ),

              SizedBox(height: 21,),

              chosenPayCode == PaymentType.PAYCODE?
              Container(
                  child: TextFormField(

                    onChanged: (e){
                      if(e.length >9){
                        setState(() {
                          showText = true;
                        });

                      }else{
                        setState(() {
                          showText = false;
                        });

                      }
                    },
                    controller: paycode,
                    decoration: InputDecoration(
                      hintText: "Enter Pay Code",
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.grey),
                      fillColor: Colors.blueGrey,
                    ),

                  )
              ): Container(),


              SizedBox(height: 35,),


              Container(
                child: Row(
                  children: [
                    Text("${deliveryAddres?.address}\n${deliveryAddres?.state}",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 14),),

                    Spacer(),


                    Icon(Icons.my_location,color: Color(0xff3ABC16),)

                  ],
                ),
              ),
              SizedBox(height: 21,),

              Row(
                children: [
                  Text("Sub Total",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                  Spacer(),
                  Text("NGN $price",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                ],
              ),
              SizedBox(height: 5,),

              Row(
                children: [
                  Text("Discount",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                  Spacer(),
                  Text("$discount",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                ],
              ),

              SizedBox(height: 21,),

              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),

              SizedBox(height: 10,),
              Row(
                children: [
                  Text("Total",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                  Spacer(),
                  Text("NGN $price",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                ],
              ),



   Spacer(),






              btnView(context),
              SizedBox(
                height: 40,
              )

            ],
          )
      ),
    );




  }

  Dialog errorDialog(context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)), //this right here
        child: InkWell(
          onTap: ()=>{
            Navigator.pop(context)

          },
          child: Container(
            height: 350.0,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: Colors.red,
                    size: 90,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Failed to process payment',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Error in processing payment, please try again",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  void _showErrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return errorDialog(context);
      },
    );
  }

  chargeCard(int amount) async {
    setState(() {
      isGeneratingCode = !isGeneratingCode;
    });

    Map accessCode = await createAccessCode(email,amount);

    setState(() {
      isGeneratingCode = !isGeneratingCode;
    });

    Charge charge = Charge()
      ..amount = amount*100
      ..accessCode = accessCode["data"]["access_code"]
      ..email = email;
    CheckoutResponse response = await PaystackPlugin.checkout(
      context,
      method:
      CheckoutMethod.selectable, // Defaults to CheckoutMethod.selectable
      charge: charge,
    );
    if (response.status == true) {

      cartPaymentBloc.payForPayCodeCart("paystack", response.reference, context);




    } else {
      _showErrorDialog();
    }
  }


  btnView(BuildContext context){

    switch(chosenPayCode) {
      case PaymentType.PAYCODE: return  Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child:showText?  RaisedGradientButton(
            child: Text(
              'Pay with Paycode',
              style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
            ),
            gradient: LinearGradient(
              colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
            ),
            onPressed: (){

              cartPaymentBloc.payForPayCodeCart("paycode", paycode?.text, context);
            }
        ): Wrap(),
      ); break;
      case PaymentType.CARD : return
        Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: RaisedGradientButton(
            child: Text(
              'Pay with Card',
              style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
            ),
            gradient: LinearGradient(
              colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
            ),
            onPressed: (){

              if (_token.data?.access_token != null){
                chargeCard(int.parse(this.amount));
              }
            }
        ),
      );
      break;
      case PaymentType.EWALLET : return  Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: RaisedGradientButton(
            child: Text(
              'Pay with E-Wallet',
              style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
            ),
            gradient: LinearGradient(
              colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
            ),
            onPressed: (){
              cartPaymentBloc.payForEWalletCart("e-wallet", context);
            }
        ),
      );
      break;
    }

  }

}//
