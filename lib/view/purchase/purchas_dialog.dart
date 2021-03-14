// import 'dart:ui';
import 'package:agro_ecomance/entity/responds/purchased/PurchaseResp.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class PurchaseDialogBox extends StatefulWidget {


  final  BuildContext context;
  final PurchaseRespData respData;

  const PurchaseDialogBox(
      {Key key,  this.context, this.respData})
      : super(key: key);

  @override
  _PurchaseDialogBox createState() => _PurchaseDialogBox();
}

class _PurchaseDialogBox extends State<PurchaseDialogBox> {




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
        child:Expanded(

    child: Column(
      children: [
        SizedBox(height: 25,),

        Row(
          children: [

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

            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child:  Text("Order ID ${widget.respData.id}",style: TextStyle(color: Color(0xff3EB120),fontSize: 15),)
            ),




          ],
        ),

        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.respData.items.length,
            itemBuilder: (context, index) {
              return CartDetailsItem(widget.respData.items[index]);
            })
      ],
    )
        ),
    )
      )
    );
  }

  CartDetailsItem(Item item ){

    return Container(



      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: Card(
        child: Row(
          children: [


            Container(
                height: 110,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: '${item?.product?.featured_image?.thumbnail_url}',
                  imageBuilder: (context, imageProvider) =>
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter:
                              ColorFilter.mode(
                                  Colors.transparent, BlendMode.colorBurn)),
                        ),
                      ),
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator(),),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                )),

            SizedBox(width: 15,),

            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Text("${item?.product?.name}", style: TextStyle(
                          fontFamily: "PoppinsRegular", fontSize: 14),),





                    ],
                  ),

                  SizedBox(height: 14,),
                  Text("NGN ${item?.product?.price}", style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 15,
                      color: Color(0xff3ABB16)),),




                ],
              ),
            ),


          ],

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
