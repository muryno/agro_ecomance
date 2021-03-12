





import 'package:agro_ecomance/entity/db/database.dart';
import 'package:agro_ecomance/entity/responds/cart/CartData.dart';
import 'package:agro_ecomance/entity/responds/cart/CartDataa.dart';
import 'package:agro_ecomance/rxbloc_pattern/cart_bloc.dart';
import 'package:agro_ecomance/utils/RaisedGradientButton.dart';
import 'package:agro_ecomance/utils/background_utils.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/utils/settings/address_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';






class CartDetailsScreen extends StatefulWidget{


  final CartDataa dat;
  final bool  fromCheckout;
  CartDetailsScreen({@required this.dat ,this.fromCheckout = false});
  @override
  _CartDetailsScreen createState()  =>  _CartDetailsScreen();


}


class _CartDetailsScreen extends State<CartDetailsScreen>{

int count = 1 ;

CartDataa acts ;
@override
  void initState () {
  acts = widget.dat;
    super.initState();
  }



@override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Container(

      height: 140,

      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: Card(
        child: Row(
          children: [


            Container(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: '${widget.dat.img_url}',
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
                      Text("${widget.dat.name}", style: TextStyle(
                          fontFamily: "PoppinsRegular", fontSize: 14),),





                    ],
                  ),

                  Text("NGN ${widget.dat.price}", style: TextStyle(
                      fontFamily: "PoppinsRegular",
                      fontSize: 15,
                      color: Color(0xff3ABB16)),),


                  SizedBox(height: 10,),


                  widget.fromCheckout? Wrap():   Expanded(
                    child: Container(
                      color: Colors.grey.withOpacity(0.2),

                      padding: EdgeInsets.symmetric(horizontal: 15),
                      height: 150,
                      child:                Listener(
                          onPointerDown: (_) =>{
                            BackgroundUtils.updateCart( product_id : widget.dat.id, weight : widget.dat.weight,   quantity :  count)
                          },
                          child:  Row(

                            children: [


                              InkWell(
                                onTap: () {
                                  if (count > 0) {
                                    setState(() {
                                      count = count - 1;
                                      widget.dat.quantity = count;
                                    });

                                  }
                                },
                                child: Icon(Icons.remove, size: 12,),
                              ),
                              SizedBox(width: 10,),
                              Text("${widget.dat.quantity}"),


                              SizedBox(width: 10,),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count = count + 1;
                                    widget.dat.quantity = count;
                                  });
                                  // acts.quantity = count;
                                  //  AppDatabase.getInstance().cartDataDao.updateQuantity(count, widget.dat.id);
                                },
                                child: Icon(Icons.add, size: 12,),
                              ),


                            ],
                          ),
                      )



                    ),
                  ),

                ],
              ),
            ),

            Spacer(),
            widget.fromCheckout? Wrap(): InkWell(
              onTap: (){

                cartBloc.deleteCart(widget.dat.uuid, context);
              },
              child:  Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child:
                Icon(Icons.clear,color: Colors.red,),
              ),
            )
          ],

        ),
      ),
    );
  }
}


