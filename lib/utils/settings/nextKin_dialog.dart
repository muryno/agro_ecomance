// import 'dart:ui';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

import '../RaisedGradientButton.dart';
import '../share_pref.dart';


class NextKinDialogBox extends StatefulWidget {


  final  BuildContext context;

  const NextKinDialogBox(
      {Key key,  this.context})
      : super(key: key);

  @override
  _NextKinDialogBox createState() => _NextKinDialogBox();
}

class _NextKinDialogBox extends State<NextKinDialogBox> {

  var _NameName = TextEditingController();

  var _email = TextEditingController();
  var _phone = TextEditingController();

  var _address = TextEditingController();
  var _city = TextEditingController();
  var _state = TextEditingController();
  var _lga = TextEditingController();




  var lat;
  var lon;



  final formKey = GlobalKey<FormState>();

  void initState() {


    StorageUtil.getProfileUser().then((value) =>
    {
      if (value != null && value.next_of_kin!= null){


          setState(() {
            _address.text = value.next_of_kin.address;
            _city.text = value.next_of_kin.city.toString();
            _state.text = value.next_of_kin.state.toString();
            _lga.text = value.next_of_kin.lga.toString();
            lat = value.next_of_kin.lat;
            lon = value.next_of_kin.long;
            _email.text=value.next_of_kin.email;
            _phone.text = value.next_of_kin.phone;
            _NameName.text = value.next_of_kin.name;
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

    Widget firstName = Container(
        child: TextFormField(
          controller: _NameName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'FullName',label: 'FullName'),
          keyboardType: TextInputType.emailAddress,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your FirstName ';
            }
            return null;
          },
        )
    );




    Widget email = Container(
        child: TextFormField(
          controller: _email,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Email',label: 'Email'),
          keyboardType: TextInputType.emailAddress,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Email Address';
            }
            return null;
          },
        )
    );


    Widget phone = Container(
        child: TextFormField(
          controller: _phone,

          decoration: ReUseAble().inputWithoutIcon(hint: 'Phone number',label: 'Phone number'),
          keyboardType: TextInputType.number,

          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Phone number';
            }
            return null;
          },
        )
    );





    Widget city = Container(
        child: TextFormField(
          controller: _city,
          decoration: ReUseAble().inputWithoutIcon(hint: 'City',label: 'City'),
          keyboardType: TextInputType.text,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your City ';
            }
            return null;
          },
        )
    );

    Widget state = Container(
        child: TextFormField(
          controller: _state,
          decoration: ReUseAble().inputWithoutIcon(hint: 'State',label: 'State'),
          keyboardType: TextInputType.text,


          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your State';
            }
            return null;
          },
        )
    );


    Widget lgs = Container(
        child: TextFormField(
          controller: _lga,

          decoration: ReUseAble().inputWithoutIcon(hint: 'Local government ',label: 'Local government'),
          keyboardType: TextInputType.text,

          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Local government ';
            }
            return null;
          },
        )
    );




    return  Container(
      child:  Form(
          key: formKey,
          child:      Container(
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
              child: ListView(
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
                            child:  Text("Next of kin Information",style: TextStyle(color: Color(0xff3EB120),fontWeight: FontWeight.bold,fontSize: 25),)
                        ),

                        SizedBox(height: 15,),
                        firstName,
                        SizedBox(height: 15,),
                        phone,
                        SizedBox(height: 15,),
                        email,

                        SizedBox(height: 15,),
                        GestureDetector(
                          onTap: (){
                            showPlacePicker(context);
                          },
                          child:  Container(
                              child: TextFormField(
                                enabled: false,
                                controller: _address,
                                decoration: ReUseAble().inputWithoutIcon(hint: 'Address',label: 'Address'),
                                keyboardType: TextInputType.emailAddress,


                                validator: (value){
                                  if(value.isEmpty   ){
                                    return 'Enter Your Address ';
                                  }
                                  return null;
                                },
                              )
                          ),
                        ),
                        SizedBox(height: 15,),
                        city,
                        SizedBox(height: 15,),
                        state,
                        SizedBox(height: 15,),
                        lgs,
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

                                  settingsBloc.addsNextOfKin(_address.text, _city.text, _email.text, _NameName.text, _state.text, _phone.text, lat, lon, _lga.text, context);
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
      ),
    );


  }
  void showPlacePicker(BuildContext context) async {



    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: "AIzaSyCKKPsJXYbDt4noigWs-KiYVK4-Bia7B34",
          useCurrentLocation: true,

          onPlacePicked: (result) {
            print(result);
            Navigator.of(context).pop();


            _address.text = result.formattedAddress.split(',')[0];
            _city.text = result.formattedAddress.split(',')[2];
            _state.text = result.formattedAddress.split(',')[2];
            lat = result.geometry.location.lat;
            lon = result.geometry.location.lng;
          },
          forceSearchOnZoomChanged: true,
          automaticallyImplyAppBarLeading: true,
          autocompleteLanguage: "en",
          region: 'NG',
          usePlaceDetailSearch: true,
          usePinPointingSearch:true,
          enableMapTypeButton: true,

        ),
      ),
    );


  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
