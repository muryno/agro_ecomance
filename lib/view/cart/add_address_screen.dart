import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/rxbloc_pattern/delivery_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

import 'package:google_maps_place_picker/google_maps_place_picker.dart';






class  AddAddressScreen extends StatefulWidget{


  @override
  _AddAddressScreen createState()  =>  _AddAddressScreen();

}


class _AddAddressScreen extends State<AddAddressScreen>{

  final progressKey = GlobalKey();

  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var phoneNumber = TextEditingController();

  var addresss = TextEditingController();
  var cities = TextEditingController();
  var states = TextEditingController();
  var nearestBuS = TextEditingController();


  double lat ;
  double lon ;
  bool setDefault = true;

  bool _showReferralCode = true;


  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;








    Widget fname = Container(
        child: TextFormField(
          controller: firstName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'First Name',label: 'First Name'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your First Name';

            }
            return null;
          },
        )
    );

    Widget lname = Container(
        child: TextFormField(
          controller: lastName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Last Name',label: 'Last Name'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Last Name';

            }
            return null;
          },
        )
    );


    Widget nearBus = Container(
        child: TextFormField(
          controller: lastName,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Nearest bus stop',label: 'Nearest bus stop'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Nearest bus stop';

            }
            return null;
          },
        )
    );

    Widget _email = Container(
        child: TextFormField(
          controller: email,
          decoration: ReUseAble().inputWithoutIcon(hint: 'Email',label: 'Email'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your Email Address';

            }
            return null;
          },
        )
    );

    Widget phone_ = Container(
        child: TextFormField(
          controller: phoneNumber,
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



    Widget _city = Container(
        child: TextFormField(
          controller: cities,
          decoration: ReUseAble().inputWithoutIcon(hint: 'City',label: 'City'),
          keyboardType: TextInputType.text,
          validator: (value){
            if(value.isEmpty   ){
              return 'Enter Your City Name ';

            }
            return null;
          },
        )
    );


    Widget _state = Container(
        child: TextFormField(
          controller: states,
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







    var checkedValue  =  false;
    return Scaffold(


      body: Form(
            key: formKey,
            child: ListView(
                  children: [

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child:  Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: <Widget>[

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


                          SizedBox(height: 30,),

                          Container(
                              padding: EdgeInsets.only(top: 40,bottom: 15),
                              child:  Text("Create Address",style: TextStyle(color: Color(0xff3EB120),fontFamily:'PoppinsRegular' ,fontSize: 25),)
                          ),

                          SizedBox(height: 15,),
                          fname,
                          SizedBox(height: 15,),
                          lname,
                          SizedBox(height: 15,),
                          _email,
                          SizedBox(height: 15,),
                          phone_,
                          SizedBox(height: 15,),
                          GestureDetector(
                              onTap: ()=>{  showPlacePicker(context) },
                              child:    Container(
                                  child: TextFormField(
                                    enabled: false,
                                    controller: addresss,
                                    decoration: ReUseAble().inputWithoutIcon(hint: 'Address',label: 'Address'),
                                    keyboardType: TextInputType.text,
                                  )
                              )
                          ),

                          SizedBox(height: 15,),
                          _city,
                          SizedBox(height: 15,),
                          _state,

                          SizedBox(height: 15,),
                          nearBus,
                          SizedBox(height: 25,),

                          Row(
                            children: [

                              Text(
                                "Set as default address?",
                                style: TextStyle(fontSize: 16,color: Color(0XFF2C2C2C),fontFamily: 'GothamBold'),
                              ),

                              Spacer(),

                              Center(
                                child: Container(
                                  child:      Center(
                                    child: Container(

                                        child:  CupertinoSwitch(value: setDefault  ,
                                            activeColor: Color(0XFF40C8F4),
                                            onChanged: (val) {
                                              setState(() {
                                                setDefault = val;
                                              });
                                            })



                                    ),
                                  ),
                                ),
                              ),




                            ],
                          ),


                          SizedBox(height: 35,),

                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            child: RaisedGradientButton(
                                child: Text(
                                  'Add Address',
                                  style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                                ),
                                onPressed: (){

                                  deliveryBloc.addDeliveryAddress(addresss.text, cities.text, email.text, firstName.text, lastName.text, states.text, phoneNumber.text, lat, lon, setDefault, nearestBuS.text, context);


                                }
                            ),
                          ),


                        ],

                      ),
                    ),

                  ],
                )

          )





    );





  }
  void showPlacePicker(BuildContext context) async {

    // Prediction p = await PlacesAutocomplete.show(
    //     context: context,
    //     apiKey: "AIzaSyCKKPsJXYbDt4noigWs-KiYVK4-Bia7B34",
    //     mode: Mode.fullscreen, // Mode.fullscreen
    //     language: "en",
    //     components: [new Component(Component.country, "ng")]);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: "AIzaSyCKKPsJXYbDt4noigWs-KiYVK4-Bia7B34",
          useCurrentLocation: true,

          onPlacePicked: (result) {
            print(result);
            Navigator.of(context).pop();


            addresss.text = result.formattedAddress.split(',')[0];
            cities.text = result.formattedAddress.split(',')[2];
            states.text = result.formattedAddress.split(',')[2];
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

}//
