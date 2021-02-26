import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/userBase.dart';
import 'package:agro_ecomance/rxbloc_pattern/delivery_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:local_auth/local_auth.dart';

import 'package:flutter_slidable/flutter_slidable.dart';







class  AddressScreen extends StatefulWidget{


  @override
  _AddressScreen createState()  =>  _AddressScreen();

}


class _AddressScreen extends State<AddressScreen>{

  final progressKey = GlobalKey();


  @override
  void initState() {
    deliveryBloc.getAddress();
    super.initState();
  }


  @override
  void dispose() {
    deliveryBloc.dispose();
    super.dispose();
  }



  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
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

                    Text("Delivery & Address",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 25),),


                    SizedBox(height: 20,),


                    Text("Delivery type",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 16),),

                    Expanded(
                      child:   DropdownButtonFormField(

                        isDense: true,
                        hint: new Text('Select delivery type',
                            textAlign: TextAlign.center),
                        items:["Deliver to my hou"].map((value) {
                          return DropdownMenuItem<String>(

                            value: value.toString(),
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {



                          setState(() {





                          });


                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color(0XFFD8D8D8).withOpacity(0.2),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Text("Select Address",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 16),),

                    StreamBuilder(
                      stream: deliveryBloc.fetchAddress,
                      builder: (context, AsyncSnapshot< List<DeliveryAddres> >  snapshot){
                        if(snapshot.hasData ){





                          if(snapshot.data.length > 0) {
                            return        Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data
                                        .length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context,
                                        index) {
                                      return  addrUi(add: snapshot.data[index]);
                                    })
                            );



                          }else{
                            return Center(child: Text("No Address available"),);
                          }




                        }else if(snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }

                        return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),





                    Spacer(),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child:    ButtonTheme(
                        height: 50,
                        minWidth: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          child: Text("Add Address",style: TextStyle(color: Color(0xff3ABC16)),),
                          onPressed: () {
                            Navigator.of(context).pushNamed(PageRouteConstants.addAddressScreen);

                          },

                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color:   Colors.grey.withOpacity(0.2),
                                width: 1,
                                style: BorderStyle.solid
                            ),
                            borderRadius: BorderRadius.circular(5.0),


                          ),
                          color: Colors.grey.withOpacity(0.2),
                          textColor: Colors.white,

                        ),
                      ),
                    ),




                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: RaisedGradientButton(
                          child: Text(
                            'Proceed to checkout',
                            style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
                          ),
                          onPressed: (){
                            Navigator.of(context).pushNamed(PageRouteConstants.paymentScreen);

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


  addrUi({DeliveryAddres add,int index}){
    return   Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child:    Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Text("${add.address}\n${add.state}",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 14),),

            Spacer(),


            add.defaults? Icon(Icons.my_location,color: Color(0xff3ABC16),)    : Icon(Icons.location_searching_sharp,color: Color(0xff3ABC16),)

          ],
        ),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Set default ',
          color: Colors.green,
          icon: Icons.my_location,
          onTap: () => {
          deliveryBloc.addDefaultAddres(add.uuid, context)
          }
        ),

      ],
      secondaryActions: <Widget>[

        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => {
            deliveryBloc.deleteAddres(add.uuid, context)

          },
        ),
      ],
    );
  }


}//
