import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/rxbloc_pattern/cartPayment_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';








class  ConfirmPaymentScreen extends StatefulWidget{


  @override
  _ConfirmPaymentScreen createState()  =>  _ConfirmPaymentScreen();

}


class _ConfirmPaymentScreen extends State<ConfirmPaymentScreen>{

  final progressKey = GlobalKey();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery
        .of(context)
        .size;









    return Scaffold(


      body:  Container(
        child: Stack(
          children: [


            Container(
              alignment: Alignment.center,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(

                    'assets/images/confirmPayment.png',
                    width: 238,height: 238,
                  ),



                  Text(
                    'Confirmation',
                    style: TextStyle(fontSize: 30,fontFamily: 'GothamRegular',color: Color(0xff3BBD19)),
                  ),

                  SizedBox(height: 15,),
                  Text(
                    'You have successfully completed \nyour payment procedure',
                    style: TextStyle(fontSize: 14,fontFamily: 'GothamRegular',color: Color(0xff656565)),textAlign:TextAlign.center,
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 60),
              child: RaisedGradientButton(
                  child: Text(
                    'Go to home screen!',
                    style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                  ),
                  gradient: LinearGradient(
                    colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                  ),
                  onPressed: (){

                    Navigator.of(context).pushNamedAndRemoveUntil(PageRouteConstants.dashBoardScreen,(r)=>false);


                    //cartPaymentBloc.makeOrderNow(context);
                  }
              ),
            ),
          ],
        ),
      )
    );




  }


}//
