
import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/payment/create_access.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';

import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';









class SignUpPaymentScreen extends StatefulWidget{


  @override
  _PaymentScreen createState()  =>  _PaymentScreen();

}


class _PaymentScreen extends State<SignUpPaymentScreen>{

  String email = "admin@agroinnovate.com";
  String amount = "5000";
  String reference_id;


  bool isGeneratingCode = false;
  @override
  void initState() {


    PaystackPlugin.initialize(
        publicKey: UrlConstant.PAYSTACK_PUBLIC_KEY);




    super.initState();
  }
  //List<dynamic> snapshotData = [];


  var reference = "";

  var refController = TextEditingController();




  bool usePayCode = true;



  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget amount = Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(

          controller: refController,
          decoration: InputDecoration(
            hintText: "Enter pay code",
            //#2C2C2C
            hintStyle: TextStyle(color: Colors.grey),
            labelText: "pay code",
            labelStyle: TextStyle(color: Colors.grey),
            hoverColor: Colors.black,
            fillColor: Colors.grey.withOpacity(0.1),
            filled: true,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),

          ),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty  && usePayCode  ){
              return 'Enter paycode';
            }
            return null;
          },
        )
    );





    return Scaffold(
        body:SingleChildScrollView(
          child:  Form(
            key: _formKey,
            child:  Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                    height: 40,
                  ),



                  Container(
                      width:   double.infinity,

                      height: MediaQuery.of(context).size.height/2-50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/c5.png"),
                          fit: BoxFit.contain,
                        ),
                      )
                  ),




                  Wrap(
                    children: [
                      Text("*Items are available for pickup at our Agroinnovate Office",style: TextStyle(color: Colors.red,fontSize: 16,fontFamily: 'PoppinsBold'),softWrap: true,textAlign: TextAlign.center,),

                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),



                  Text("Select a Payment Method",style: TextStyle(color: Color(0xff858585),fontSize: 16,fontFamily: 'PoppinsBold'),),

                  SizedBox(
                    height: 30,
                  ),


                  GestureDetector(
                    onTap: (){
                     setState(() {

                       usePayCode = false;
                     });
                    },
                    child:   Row(
                      children: [
                        !usePayCode?    Icon(Icons.radio_button_checked_sharp,color: Colors.green,size: 24,)  : Icon(Icons.radio_button_off_sharp,color: Colors.green,size: 24,),
                        SizedBox(
                          width: 20,
                        ),

                        Text("Use Debit Card",style: TextStyle(color: Color(0xff3CBE1B),fontSize: 21,fontFamily: 'PoppinsRegular'),),

                      ],
                    ),
                  ),


                  SizedBox(
                    height: 30,
                  ),


                  GestureDetector(
                    onTap: (){
                      setState(() {
                        usePayCode  = true;
                      });
                    },
                    child:  Row(
                      children: [
                        usePayCode?    Icon(Icons.radio_button_checked_sharp,color: Colors.green,size: 24,)  : Icon(Icons.radio_button_off_sharp,color: Colors.green,size: 24,),
                        SizedBox(
                          width: 20,
                        ),

                        Text("Use Paycode",style: TextStyle(color: Color(0xff858585),fontSize: 24,fontFamily: 'PoppinsRegular'),),

                      ],
                    ),
                  ),

                  SizedBox(
                    height: 50,
                  ),


                  usePayCode?  amount : Container(),


                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child:    Text("NGN5,000",style: TextStyle(color: Color(0xff3ABC16),fontSize: 51,fontFamily: 'PoppinsBold')),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child:  RaisedButton(





                        onPressed: () {
                          usePayCode?
                          loginBloc.verifyReference(refController.text ,"paycode" , context)
                         : Helper.toastInfo("loading payment method...");
                          chargeCard(int.parse(this.amount));
                        },




                        child: Text("MAKE PAYMENT",style: TextStyle(
                            color: Colors.white
                        ),),
                        color: Color(0xff3ABC16)
                    ),
                  )
                ],
              ),
            ),
          )
        )
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


      loginBloc.verifyReference(response.reference ,"paystack" , context);

     // Navigator.of(context).popAndPushNamed(PageRouteConstants.confirmPaymentScreen);


    } else {
      _showErrorDialog();
    }
  }

}