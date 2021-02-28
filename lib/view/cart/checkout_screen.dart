
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/entity/responds/loginToken.dart';
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








class  CheckOutScreen extends StatefulWidget{

 final List<dynamic> snapshotData;
  CheckOutScreen({this.snapshotData});


  @override
  _CheckOutScreen createState()  =>  _CheckOutScreen();

}


class _CheckOutScreen extends State<CheckOutScreen>{

  final progressKey = GlobalKey();
  int count = 0;
  bool isGeneratingCode = false;

  String reference_id;
  String Sub_id;
  String email;
  String amount = "5000";

  List<CartDataa>   snapshotDta;
  DeliveryAddres  deliveryAddres;



  loginToken _token;
  @override
  void initState() {

    snapshotDta  =  widget.snapshotData[0];
    cartBloc.addAllIncrementICarts(widget.snapshotData[0]);
    deliveryAddres  =   widget.snapshotData[1];


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


  @override
  Widget build(BuildContext context) {

   // snapshotData = ModalRoute.of(context).settings.arguments;



    final size = MediaQuery
        .of(context)
        .size;










    return Scaffold(


      body:  Stack(


        children: <Widget>[

        SingleChildScrollView(
          child:   Form(
            key: formKey,
            child: Container (
                width: size.width,
                height: size.height,
                margin: EdgeInsets.only(top: 50,left: 16,right: 16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 35,),

                    InkWell(
                      child:    Icon(
                        Icons.arrow_back_outlined,

                        size: 25,
                      ),
                      onTap: (){
                        Navigator.of(context).pop();

                      },
                    ),

                    SizedBox(height: 20,),

                    Text("Check Out",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsRegular' ,fontSize: 25),),



                    SizedBox(height: 20,),




                    // StreamBuilder(
                    //   stream: cartBloc.fetchCart,
                    //   builder: (context, AsyncSnapshot< List<CartDataa> >  snapshot){
                    //     if(snapshot.hasData ){
                    //
                    //      // snapshotData = snapshot.data;
                    //       return   Container(
                    //           child: ListView.builder(
                    //               shrinkWrap: true,
                    //               itemCount: snapshot.data.length,
                    //               physics: NeverScrollableScrollPhysics(),
                    //               itemBuilder: (context,index){
                    //                 return CartDetailsScreen( dat : snapshot.data[index] );
                    //               })
                    //       );
                    //
                    //
                    //     }else if(snapshot.hasError) {
                    //       return Text(snapshot.error.toString());
                    //     }
                    //
                    //     return Center(child: CircularProgressIndicator(),);
                    //   },
                    // ),

                Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshotDta.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return CartDetailsScreen( dat :snapshotDta[index] );
                        })
                ),



                    // ...List.generate(2, (index) =>   Container(
                    //
                    //   height: 140,
                    //
                    //   padding: EdgeInsets.symmetric(vertical: 10),
                    //   child: Card(
                    //     child: Row(
                    //       children: [
                    //         Image.asset(
                    //
                    //           'assets/images/banana.png',
                    //           width: 90,height: 100,fit: BoxFit.fill,
                    //         ),
                    //         SizedBox(width: 15,),
                    //
                    //         Container(
                    //           padding: EdgeInsets.symmetric(vertical: 15),
                    //           child:  Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Stack(
                    //                 children: [
                    //                   Text("Basket of Tomatoes",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 14),),
                    //
                    //
                    //                   // InkWell(
                    //                   //   onTap: (){},
                    //                   //   child:  Align(
                    //                   //     alignment: Alignment.topRight,
                    //                   //     child:
                    //                   //     Icon(Icons.clear),
                    //                   //   ),
                    //                   // )
                    //
                    //
                    //                 ],
                    //               ),
                    //
                    //               Text("NGN 500",style: TextStyle(fontFamily: "PoppinsRegular",fontSize: 15,color: Color(0xff3ABB16)),),
                    //
                    //
                    //
                    //               SizedBox(height: 10,),
                    //               Expanded(
                    //                 child:    Container(
                    //                   color: Colors.grey.withOpacity(0.2),
                    //
                    //                   padding: EdgeInsets.symmetric(horizontal: 15),
                    //                   height: 150,
                    //                   child:     Row(
                    //
                    //                     children: [
                    //
                    //
                    //                       InkWell(
                    //                         onTap: (){
                    //                           if(count>  0) {
                    //                             setState(() {
                    //                               count = count - 1;
                    //                             });
                    //                           }
                    //                         },
                    //                         child:  Icon(Icons.remove,size: 12,),
                    //                       ),
                    //                       SizedBox(width: 10,),
                    //                       Text("$count"),
                    //
                    //
                    //                       SizedBox(width: 10,),
                    //                       InkWell(
                    //                         onTap: (){
                    //                           setState(() {
                    //                             count = count + 1;
                    //                           });
                    //                         },
                    //                         child:   Icon(Icons.add,size: 12,),
                    //                       ),
                    //
                    //
                    //                     ],
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         )
                    //       ],
                    //
                    //     ),
                    //   ),
                    // )),
                    SizedBox(height: 21,),

                    Container(
                      child: Row(
                        children: [
                          Text("${deliveryAddres.address}\n${deliveryAddres.state}",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 14),),

                          Spacer(),


                          Icon(Icons.my_location,color: Color(0xff3ABC16),)

                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Text("Sub Total",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("NGN 5000",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),
                    SizedBox(height: 5,),

                    Row(
                      children: [
                        Text("Discount",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("5%",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),

                    SizedBox(height: 10,),

                    Row(
                      children: [
                        Text("Shipping",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                        Spacer(),
                        Text("NGN400",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),

                    SizedBox(height: 10,),

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
                        Text("NGN5400",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                      ],
                    ),
                    Spacer(),





                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: RaisedGradientButton(
                          child: Text(
                            'Buy',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){

                            if (_token.data?.access_token != null){
                              chargeCard(int.parse(this.amount));
                            }
                            else{
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  PageRouteConstants.view_page, (r) => false
                              );
                            }
                          }
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )

                  ],
                )
            ),
          )
        )

        ],


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

      Navigator.of(context).popAndPushNamed(PageRouteConstants.confirmPaymentScreen);


    } else {
      _showErrorDialog();
    }
  }


}//
