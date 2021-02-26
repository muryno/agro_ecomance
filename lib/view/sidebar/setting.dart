

import 'package:agro_ecomance/entity/responds/UserProfile.dart';
import 'package:agro_ecomance/rxbloc_pattern/setting_bloc.dart';
import 'package:agro_ecomance/utils/constants/url_constant.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:agro_ecomance/view/sidebar/purchase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'logout.dart';
import 'shoping.dart';
import 'Network.dart';
import 'commision.dart';
import 'dashboard.dart';
import 'ewallet.dart';

class SettingScreen extends StatefulWidget {

  final UserProfileData userProfileData;

  SettingScreen({@required  this.userProfileData});


  @override
  _Screen15State createState() => _Screen15State();
}

class _Screen15State extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isNotification = false;
  bool _isNewsLetter = false;


  final picker = ImagePicker();

  String _str;
  String token;

  @override
  void initState() {
 settingsBloc.getBankDetails();
    super.initState();
  }

  @override
  void dispose() {
    settingsBloc.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        key: _scaffoldKey,
      backgroundColor: Color(0xffF7F7F7),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          backgroundColor: Colors.white,
          actions: [
            // IconButton(
            //   icon: Icon(
            //     Icons.search,
            //     color: Colors.black,
            //   ),
            //   onPressed: () {},
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0, left: 16.0),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                ),
                onPressed: () {

                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 14.0),
              child:InkWell(
                onTap: (){

                },
                child:     Container(
                    width: 40,
                    height: 40,
                    child:  CircleAvatar(
                      backgroundColor: ReUseAble().getButtonColor(),
                        radius: 20,child: Icon(Icons.person,color: Colors.white, size: 30))
                ),
              ) ,
            )
          ],
        ),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [



              Text(
                "PROFILE",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFFABA3A3),
                    fontFamily:'PoppinsBold' ),
              ),
               SizedBox(
                height: 24.0,
              ),

              Row(
                children: [

                  Container(


                    padding: EdgeInsets.symmetric(horizontal: 5),
                    width: 97,
                    height: 97,
                    child:    Stack(
                      children: [

                        Container(
                            width: 97,
                            height: 97,
                            child:  CircleAvatar(
                                radius: 60,child: Icon(Icons.person, size: 30))
                        ),



                        InkWell(
                          onTap: ()=>{
                            showApp(context)
                          },
                          child:   Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child:
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: ReUseAble().getButtonColor(),
                              child:Icon(
                                Icons.party_mode,
                                size: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 25,),
                  Wrap(
                    children: [
                      Text(
                        "Account Created\nJanuary 15, 2021",
                        style:  TextStyle(fontSize: 8,fontFamily: 'GothamRegular'),
                      )
                    ],
                  )
                ],
              ),


              SizedBox(
                height: 24.0,
              ),



              Card(
                  margin: EdgeInsets.only(bottom: 12.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0),


                        SizedBox(height: 20.0),

                        InkWell(
                          child:
                          ListTile(
                              tileColor: Colors.black.withOpacity(0.05),
                              title: Text("Personal Information"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )
                          ),
                            onTap: ()=>{
                              ReUseAble().personalDialogBox(context)
                            },
                        ),
                         SizedBox(height: 8.0),
                        InkWell(
                          child:
                          ListTile(
                              tileColor: Colors.black.withOpacity(0.05),
                              title: Text("Address"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )),
                          onTap: ()=>{
                            ReUseAble().addressDialogBox(context)
                          },
                        ),
                        SizedBox(height: 8.0),
                        InkWell(
                          child:
                          ListTile(
                              tileColor: Colors.black.withOpacity(0.05),
                              title: Text("Security"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )),
                          onTap: ()=>{
                            ReUseAble().securityDialogBox(context)
                          },
                        ),
                        SizedBox(height: 8.0),
                        InkWell(
                          child:
                          ListTile(
                              tileColor: Colors.black.withOpacity(0.05),
                              title: Text("Bank Information"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )),
                          onTap: ()=>{
                            ReUseAble().bankDialogBox(context)

                          },
                        ),
                        SizedBox(height: 8.0),

                        InkWell(
                          child:
                          ListTile(
                              tileColor: Colors.black.withOpacity(0.05),
                              title: Text("Next of Kin Details"),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                              )),
                          onTap: ()=>{
                            ReUseAble().nextKinDialogBox(context)
                          },
                        ),

                         SizedBox(height: 36.0),
                        Text(
                          "Your Preferences",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0Xff0B2E70),
                          ),
                        ),
                         SizedBox(height: 8.0),
                        ListTile(
                            tileColor: Colors.black.withOpacity(0.05),
                            title: Text("Notifications"),
                            trailing:
                                CupertinoSwitch(
                                  
                                  value: _isNotification, onChanged: (val) {
                                  setState(() {
                                    _isNotification = val;
                                  });
                                })),

                      ],
                    ),
                  )),
            ],
          ),
        ),

        drawer: Container(



            width: MediaQuery.of(context).size.width * 0.7,
            child: Drawer(
              child: SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF3ABC16), Color(0xFF66EA96)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter),
                  ),


                  child: ListView(
                    children: [

                      Container(
                        color: Colors.white,
                        height: 170,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [

                            Container(
                                width: 80,
                                height: 80,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child:   CircleAvatar(
                                    backgroundColor: ReUseAble().getButtonColor(),
                                    radius: 20,child: Icon(Icons.person,color: Colors.white, size: 60))
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text("${widget?.userProfileData?.username}",style: TextStyle(fontSize: 20,color: Color(0xff003C5E),fontFamily: 'PoppinsBold'),),
                                Text("REF ID: 3Y92Q1",style: TextStyle(fontSize: 16,color: Color(0xff003C5E)),)

                              ],

                            )



                          ],
                        ),
                      ),

                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(HomePageDashboard(userProfileData:widget.userProfileData))
                        );},
                        child:
                        ReUseAble().drawerItem(title: "Dashboard",icon: Icons.dashboard),
                      ),

                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(Commission(userProfileData:widget.userProfileData))
                        );},
                        child:
                        ReUseAble().drawerItem(title: "Commissions",icon: Icons.alternate_email_sharp,),
                      ),


                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(Purchase(userProfileData:widget.userProfileData))
                        );},
                        child:
                        ReUseAble().drawerItem( title: "Purchases",icon: Icons.shopping_basket, ),
                      ),



                      GestureDetector(
                        onTap: (){ Navigator.of(context).push(
                            ReUseAble().getTransition(NetworkScreen(userProfileData:widget.userProfileData))
                        );},
                        child:
                        ReUseAble().drawerItem( title: "Network",icon: Icons.share, ),
                      ),


                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(EWallet(userProfileData:widget.userProfileData))
                          );
                        },
                        child:
                        ReUseAble().drawerItem(title: "E-wallet",icon: Icons.account_balance_wallet_rounded, ),
                      ),






                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(SettingScreen(userProfileData:widget.userProfileData))
                          );
                        },
                        child:
                        ReUseAble().drawerItem(isActive:true,title: "Profile",icon: Icons.person, ),
                      ),



                      GestureDetector(
                        onTap: (){

                        },
                        child:
                        ReUseAble().drawerItem(title: "Wish / Bookings",icon: Icons.card_travel_sharp, ),
                      ),




                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(LogoOut())
                          );
                        },
                        child:
                        ReUseAble().drawerItem(title: "Logout",icon: Icons.exit_to_app_sharp, ),
                      ),


                      Spacer(),


                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                              ReUseAble().getTransition(DashBoardScreen())
                          );
                        },
                        child:
                        ReUseAble().drawerItem(title: "Continue Shopping",icon: Icons.arrow_back, ),
                      ),





                    ],
                  ),
                ),
              ),
            ))
    );
  }


  Future<bool> showApp(BuildContext context) {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Chose how you want to upload'),

        actions: <Widget>[

          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child:  Column(
              children: [
                FlatButton(
                  onPressed: () {

                    getImage("Gallery");
                    Navigator.of(context).pop();
                  },
                  child: Text('Pick from local phone gallery',style: TextStyle(color: Colors.green ,fontFamily: 'GothamMedium',fontSize: 15),),
                ),

                FlatButton(
                  onPressed: () {
                    getImage("Camera");
                    Navigator.of(context).pop();
                  },
                  child: Text('Upload from phone camera',style: TextStyle(color: Colors.green.withOpacity(0.8),fontFamily: 'GothamMedium',fontSize: 15),),
                ),


                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel',style: TextStyle(color: Colors.black,fontFamily: 'GothamMedium',fontSize: 15)),
                ),



              ],
            ),
          )


        ],
      ),
    ) ??
        false;
  }




  Future getImage( String _selected) async {



    PickedFile pickedFile;
    if (_selected == "Camera"){
      pickedFile= await picker.getImage(source: ImageSource.camera);
    }else if (_selected == "Gallery"){
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    }


    setState(() {
      if (pickedFile != null) {

       // settingsBloc.uploadProfile(pickedFile.path, this._str,this.token,  context);
      } else {
        print('No image selected.');
      }
    });
  }



}
