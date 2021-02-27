// import 'dart:ui';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/wish_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class AddWishDialogBox extends StatefulWidget {


  final  BuildContext context;

  const AddWishDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _AddressDialogBox createState() => _AddressDialogBox();
}

class _AddressDialogBox extends State<AddWishDialogBox> {

  var _wish = TextEditingController();









  final formKey = GlobalKey<FormState>();

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



    Widget wish = Container(
        child: TextFormField(
          controller: _wish,

          decoration: ReUseAble().inputWithoutIcon(hint: 'Enter your  Wish  ',label: 'Enter your  Wish '),
          keyboardType: TextInputType.text,

          validator: (value){
            if(value.isEmpty   ){
              return 'Enter your  Wish  ';
            }
            return null;
          },
        )
    );



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
                      child:  Text("Add Wish Basket",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                  ),

                  SizedBox(height: 15,),

                  wish,
                  SizedBox(height: 35,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: RaisedGradientButton(
                        child: Text(
                          'Add Wish',
                          style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){
                          if (formKey.currentState.validate()) {
                            wishBloc.addWishList(_wish.text, context);
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

}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
