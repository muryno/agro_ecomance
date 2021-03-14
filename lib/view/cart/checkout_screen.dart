
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
import 'package:agro_ecomance/view/cart/payout_screen.dart';
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

  List<CartDataa>   snapshotDta;
  DeliveryAddres  deliveryAddres;

  int transport = 0;


  loginToken _token;
  @override
  void initState() {

    snapshotDta  =  widget.snapshotData[0];
    deliveryAddres  =   widget.snapshotData[1];

    snapshotDta.forEach((element) { price  +=( int.parse(element.price ) * element.quantity );
    deliveryAddres.deliverType == 1 ?transport =  500 :transport =  0;


    });



    
    StorageUtil.getUser().then((value) {
      if (value != null) {
        _token = value;
      }
 });



    super.initState();
  }
  //List<dynamic> snapshotData = [];
  final formKey = GlobalKey<FormState>();

  var price = 0;
  var discount = 0;



  @override
  Widget build(BuildContext context) {

   // price =  transport+price;

    final size = MediaQuery
        .of(context)
        .size;










    return Scaffold(


      body:   Container (
          width: size.width,
          height: size.height,
          margin: EdgeInsets.only(top: 10,left: 16,right: 16),

          child: ListView(

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

              Text("Check Out",style: TextStyle(color: Color(0xff3ABC16),fontFamily:'PoppinsRegular' ,fontSize: 25),),



              SizedBox(height: 10,),




              Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshotDta.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index){
                        return CartDetailsScreen( dat :snapshotDta[index],fromCheckout:true );
                      })
              ),



              SizedBox(height: 21,),

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
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("Transport",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsBook' ,fontSize: 13),),
                  Spacer(),
                  Text("$transport",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),
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
                  Text("NGN ${price+transport}",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 15),),

                ],
              ),



              SizedBox(
                height: 25,
              ),





              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: RaisedGradientButton(
                    child: Text(
                      'Proceed to Payment',
                      style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                    ),
                    onPressed: (){


                      Navigator.of(context).push(
                          ReUseAble().getTransition(PayOutScreen(snapshotData: widget?.snapshotData))
                      );


                    }
                ),
              ),
              SizedBox(
                height: 40,
              )

            ],
          )
      ),
    );




  }


}//
