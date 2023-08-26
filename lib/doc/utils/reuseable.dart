

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';







class ReUseAble {

  /// TextField with icon **/
  InputDecoration inputWithSuffixIcon(String str, IconData icon) {
    return InputDecoration(
      hintText: str,
      hintStyle: TextStyle(color: Colors.grey),
      labelText: str,
      labelStyle: TextStyle(color: Colors.grey),
      hoverColor: Colors.black,
      fillColor: Colors.white,

      errorStyle: TextStyle(color: getButtonColor()),
      filled: true,
      suffixIcon: Icon(icon, color:Colors.black,),


    );}

  /// TextField without icon **/
  InputDecoration inputWithoutIcon(String str) {
    return InputDecoration(
      hintText: str,
      hintStyle: TextStyle(color: Colors.grey),
      labelText: str,
      labelStyle: TextStyle(color: Colors.grey),
      hoverColor: Colors.black,
      fillColor: Colors.white,
      filled: true,
      errorStyle: TextStyle(color: getButtonColor()),



    );}


  /// TextField without icon **/
  InputDecoration inputWithoutIconAndBorder(String str) {
    return InputDecoration(
      hintText: str,
      hintStyle: TextStyle(color: Colors.grey),

    );}


  BoxDecoration getBoxDecoration(){
    return  BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5) ,
        color: Colors.white70
    );
  }


getBlueColor(){
    return Color(0xFF56a5c8);
}


  getRedColor(){
    return Color(0xFF953233);
  }

  getButtonColor(){
    return Color(0xFF6FCF97);
  }

  getBackgroundColor(){
    return Color(0xFF2D2D2D);
  }
  getGreyColor(){
    return Color(0xFFE5E5E5);
  }

  getDarkGreyColor(){
    return Color(0xFFDADADA);
  }


  getCallColor(){
    return Color(
      0xFF1D1E33,
    );
  }
  //, 100%




//
//  TextStyle getMediumWhite17Font(){
//    return TextStyle(fontFamily: 'GothamBold',fontSize: 17,color: Colors.white);
//  }




   getSnacks(BuildContext context){
    final snackBar = SnackBar(
      content: Text('Copied to Clipboard'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }



  getBackgroundImage(String img,BuildContext context){


    return Container(
      color: ReUseAble().getBackgroundColor(),

      child: Stack(

          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)),
                child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            ReUseAble().getBackgroundColor()
                          ]
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.darken,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height ,
                        decoration: BoxDecoration(

                          image: DecorationImage(
                            image: AssetImage('assets/$img'),
                            fit: BoxFit.cover,
                          ),
                        )
                    ))
            )
          ]
      ),
    );

  }


  getCallBackground(BuildContext context){


    return Container(
      color: ReUseAble().getBlueColor(),


      child: Column(

          children: [
            ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)),
                child: ShaderMask(

                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            ReUseAble().getBlueColor()
                          ]
                      ).createShader(bounds);
                    },
                    blendMode: BlendMode.darken,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height ,
                        decoration: BoxDecoration(
                          color: ReUseAble().getBlueColor(),
                        )
                    ))
            )
          ]
      ),
    );

  }


  //font reuseable
  TextStyle getLightBookFont(){
    return TextStyle(fontFamily: 'GothamBook',fontSize: 12,color: Colors.white);
  }

  TextStyle getFirstBoldFont(){
    return TextStyle(fontFamily: 'GothamBold',fontSize: 17,color: Colors.white);
  }

  TextStyle getSecondBoldFont(){
    return TextStyle(fontFamily: 'GothamBold',fontSize: 22,color: Colors.white);
  }


  TextStyle getMediumI4Font(){
    return TextStyle(fontFamily: 'GothamBook',fontSize: 14,color: Colors.white);
  }
  TextStyle getBoldI4darkFont(){
    return TextStyle(fontFamily: 'GothamMedium',fontSize: 15,color: getBackgroundColor());
  }

  TextStyle getNavBoldFont(){
    return TextStyle(fontFamily: 'GothamBold',fontSize: 14,color: Colors.white);
  }

  TextStyle getMediumI3Font(){
    return TextStyle(fontFamily: 'GothamMedium',fontSize: 13,color: Colors.white);
  }


  TextStyle getBold17Font(){
    return TextStyle(fontFamily: 'GothamBold',fontSize: 17,color: getBackgroundColor());
  }

  TextStyle getBold13Font(){
    return TextStyle(fontFamily: 'GothamBold',fontSize: 13,color: getBackgroundColor());
  }

  TextStyle getMediumI2DarkFont(){
    return TextStyle(fontFamily: 'GothamBook',fontSize: 12,color: getBackgroundColor());
  }


  TextStyle getMediumWhite17Font(){
    return TextStyle(fontFamily: 'GothamBold',fontSize: 17,color: Colors.white);
  }



  Dialog successDialog(context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)), //this right here
      child: Stack(
        children: [
          Container(
            height: 500.0,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  CircleAvatar(
// borderRadius: BorderRadius.circular(45),
                    radius: 30,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Thank You',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'We have received your request and confirm you after few minutes.',
                      style: TextStyle(
                        color: Colors.black,
// fontSize: 17.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "REFERENCE ID: DOC5673HY",
                    style: TextStyle(
                        fontSize: 13,
                        color: ReUseAble().getRedColor(),
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(thickness: 2.0,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Tue, 27 Mar, 2020 in 3 days",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Appts Time",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "9:00AM",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "To",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Dr. Jennifer Kahn\nGeneral Practitioner",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: ReUseAble().getRedColor(),
                              child: Icon(Icons.person, size: 30),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact Type",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text(
                              "Video",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
                        ButtonTheme(
                          minWidth: double.infinity,
                          height: 45,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "OK, THANKS!",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: ReUseAble().getButtonColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }




  getCustomProgress(String txt){
    return Container (


      decoration: ReUseAble().getBackgroundColor(),

      child: Stack(



        children: <Widget>[

          Container(

              padding: EdgeInsets.symmetric(vertical: 40,horizontal: 20),

              child: Image.asset("assets/images/logo.png",height: 30,)
          ),



          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 50),

              child:  Text(txt,
                style: ReUseAble().getMediumWhite17Font(),
              )
          ),








        ],

      ),
    );
  }



}//










