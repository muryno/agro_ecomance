// import 'dart:ui';
import 'package:agro_ecomance/entity/responds/WishBaskResp.dart';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/rxbloc_pattern/wish_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class AddMoreWishDialogBox extends StatefulWidget {


  final  BuildContext context;
  final WishBaskData wishBaskData;

  const AddMoreWishDialogBox(
      {Key key,  this.context,this.wishBaskData})
      : super(key: key);

  @override
  _AddMoreWishDialogBox createState() => _AddMoreWishDialogBox();
}

class _AddMoreWishDialogBox extends State<AddMoreWishDialogBox> {

  var frequency = "weekly";





  bool showReminder = false;




  final formKey = GlobalKey<FormState>();


  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    final TimeOfDay newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;

      });
    }
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




                  SizedBox(height: 35,),

                  Container(

                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: RaisedGradientButton(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Set Reminder',
                              style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                            ),
                            SizedBox(width: 15,),
                            Icon(
                              showReminder ?
                              Icons.keyboard_arrow_down_sharp
                                  :
                              Icons.arrow_forward_ios_sharp,
                              size: 18,
                              color: Colors.white,
                            )
                          ],
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){

                          setState(() {
                             showReminder==false ? showReminder =  true: showReminder =  false;
                          });

                        }
                    ),
                  ),


                  showReminder?  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("Frequency"),

                            Text("Time"),
                          ],
                        ),

                        Row(
                          children: [

                           Flexible(
                              flex: 1,
                               child:  DropdownButtonFormField(

                                 isDense: true,
                                 hint: new Text('weekly ',
                                     textAlign: TextAlign.center),
                                 items:["daily","weekly","monthly"].map((value) {
                                   return DropdownMenuItem<String>(

                                     value: value.toString(),
                                     child: Text(value),
                                   );
                                 }).toList(),
                                 onChanged: (value) {
                                   frequency = value;
                                 },

                                 decoration: InputDecoration(

                                   border: InputBorder.none,
                                   filled: true,
                                   fillColor: Color(0XFFD8D8D8).withOpacity(0.2),
                                 ),
                               ),
                           ),

                            Flexible(
                              flex: 1,
                              child:InkWell(
                                onTap: (){
                                  _selectTime();
                                },
                                child:  Container(
                                  alignment: Alignment.centerRight,
                                  child:   Text(
                                    '${_time.format(context)}',
                                  ),
                                ),
                              )
                            ),


                          ],
                        ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50,vertical: 15),
                          width: 100,
                          height: 35,
                          child: RaisedGradientButton(
                              child: Text(
                                'Set',
                                style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                              ),
                              gradient: LinearGradient(
                                colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                              ),
                              onPressed: (){

                                var myTime =  "${_time.hour}:${_time.minute}";
                                wishBloc.setWishReminder(frequency, myTime,widget.wishBaskData.uuid, context);

                              }
                          ),
                        ),
                      ],
                    ),
                  ) : Container(),
                  SizedBox(height: 15,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: RaisedGradientButton(
                        child: Text(
                          'Save Wish Basket',
                          style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){


                        }
                    ),
                  ),

                  SizedBox(height: 35,),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: RaisedGradientButton(
                        child: Text(
                          'Convert to Booking',
                          style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                        ),
                        onPressed: (){


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
