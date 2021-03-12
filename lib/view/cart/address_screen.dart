import 'package:agro_ecomance/entity/request/login_request.dart';
import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/entity/userBase.dart';
import 'package:agro_ecomance/rxbloc_pattern/delivery_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/helper.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:local_auth/local_auth.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'checkout_screen.dart';







class  AddressScreen extends StatefulWidget{


  @override
  _AddressScreen createState()  =>  _AddressScreen();

}


class _AddressScreen extends State<AddressScreen>{

  final progressKey = GlobalKey();
  var addresss = TextEditingController();

  int selectedPickup = 0;

  @override
  void initState() {
    deliveryBloc.emptyAddress();
    super.initState();
  }


  @override
  void dispose() {
    deliveryBloc.dispose();
    super.dispose();
  }



  final formKey = GlobalKey<FormState>();

  List<CartDataa>   snapshotData;
  DeliveryAddres  deliveryToCustomerAddress;
  DeliveryAddres  deliveryToPickUp;
  int deliveryType = 0;

  @override
  Widget build(BuildContext context) {

    snapshotData = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery
        .of(context)
        .size;




    //    //'Select delivery type'  == 0
    //    //'"Deliver to pick-up"  == 2
    //    //"Deliver to customer",  == 1






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

                    DropdownButtonFormField(

                      isDense: true,
                      hint: new Text('Select delivery type',
                          textAlign: TextAlign.center),
                      items:["Deliver to customer","Deliver to pick-up"].map((value) {
                        return DropdownMenuItem<String>(

                          value: value.toString(),
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {

                        if (value == "Deliver to pick-up") {
                          deliveryBloc.emptyAddress();
                          deliveryToCustomerAddress = DeliveryAddres();
                          deliveryToPickUp =  DeliveryAddres();

                          setState(() {
                            deliveryType = 2;
                          });

                        } else if (value == "Deliver to customer") {

                          deliveryBloc.getAddress();
                          deliveryToCustomerAddress   =   DeliveryAddres();
                          deliveryToPickUp   =   DeliveryAddres();


                          setState(() {
                            deliveryType = 1 ;
                          });
                        }else{
                          setState(() {
                            deliveryType = 0 ;
                          });

                        }




                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color(0XFFD8D8D8).withOpacity(0.2),
                      ),
                    ),

                    SizedBox(height: 20,),
                    deliveryType ==2 ?   GestureDetector(
                        onTap: ()=>{  showPlacePicker(context) },
                        child:    Container(
                            child: TextFormField(
                              enabled: false,
                              controller: addresss,
                              decoration: InputDecoration(
                                hintText: "Select your nearest location",
                                hintStyle: TextStyle(color:  Color(0xff3CBE1B)),
                                labelStyle: TextStyle(color:  Color(0xff3CBE1B)),
                                fillColor: Colors.blueGrey,
                              ),

                            )
                        )
                    ):Container(),


                    SizedBox(height: 20,),
                    deliveryType ==1 ?   Text("Select your delivery address",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 16),):Wrap(),

                    deliveryType ==2 ?   Text("Select your pick-up address",style: TextStyle(color: Color(0xff3CBE1B),fontFamily:'PoppinsRegular' ,fontSize: 16),):Wrap(),

                    deliveryType !=0 ?   StreamBuilder(
                      stream: deliveryBloc.fetchAddress,
                      builder: (context, AsyncSnapshot< List<DeliveryAddres> >  snapshot){
                        if(snapshot.hasData ){






                          if(snapshot.data.length > 0) {

                            return        Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context,
                                        index) {
                                      return  snapshot.data[0].defaults!= null ?  addrUi(add: snapshot.data[index]) :  addPickUpItem(add: snapshot.data[index]);///;
                                    })
                            );



                          }else{
                            return Center(child: Text("No Address available"),);
                          }




                        }else if(snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        }

                        return deliveryType == 1 ?Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ): Wrap();
                      },
                    ): Container(),





                    Spacer(),
                    deliveryType ==1  ? Container(
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
                    ): Wrap(),


                    btnToShow(deliveryType ),



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
    deliveryToCustomerAddress = add.defaults ? add : DeliveryAddres();


    return InkWell(
      onTap: (){
        deliveryBloc.addDefaultAddres(add.uuid, context);
      },
      child:    Slidable(
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
      ),
    );
  }




  addPickUpItem({DeliveryAddres add,int index}){

    return   InkWell(
      onTap: (){
        deliveryToPickUp = add;

        setState(() {
          selectedPickup = add.id;

        });
      },

      child:    Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Text("${add.address}\n${add.state}",style: TextStyle(color: Color(0xff434343),fontFamily:'PoppinsRegular' ,fontSize: 14),),

            Spacer(),


            selectedPickup ==add.id?  Icon(Icons.my_location,color: Color(0xff3ABC16),)    :   Icon(Icons.location_searching_sharp,color: Color(0xff3ABC16),)

          ],
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


            addresss.text = result.formattedAddress.split(',')[0];
            deliveryBloc.getPickupAddress( result.geometry.location.lat??6.5244, result.geometry.location.lng??3.3792,context);


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

  btnToShow(int akt){

    switch(akt){
      case 0 : return Container();

      case 1 : return  Container(
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: RaisedGradientButton(
            child: Text('Deliver to customer',
              style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
            ),
            gradient: LinearGradient(
              colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
            ),
            onPressed: (){

              if(deliveryToCustomerAddress?.uuid !=  null) {

                List<dynamic> dfr = [];
                dfr.add(snapshotData);
                dfr.add( deliveryToCustomerAddress );

                deliveryBloc.setDeliveryAddress(deliveryToCustomerAddress?.uuid,dfr, context);
              }else{
                Helper.toastError("No Address is selected");
              }

              //
              //
              // List<dynamic> dfr = [];
              // dfr.add(snapshotData);
              // dfr.add(deliveryAddres);
              //
              //
              //
              // Navigator.of(context).push(
              //     ReUseAble().getTransition(CheckOutScreen(snapshotData: dfr))
              // );



            }
        ),
      );

      case 2 : return  Container(

        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

        child: RaisedGradientButton(

            child: Text('Deliver to pick-up',
              style: TextStyle(fontSize: 18,fontFamily: 'GothamBold',color: Colors.white),
            ),
            gradient: LinearGradient(
              colors: <Color>[Color(0xff3EB120), Colors.greenAccent],
            ),
            onPressed: (){

              if(deliveryToPickUp?.id !=  null) {


                List<dynamic> dfr = [];
                dfr.add(snapshotData);
                dfr.add( deliveryToPickUp);
                deliveryBloc.setPickUpAddress(deliveryToPickUp?.id,dfr , context);


              }else{

                Helper.toastError("No Address is selected");
              }

            }
        ),
      );



    }
  }
}//
