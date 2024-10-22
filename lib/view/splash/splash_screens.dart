



import 'package:agro_ecomance/entity/request/openBefore.dart';
import 'package:agro_ecomance/server/retrofit_clients.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/share_pref.dart';
import 'package:flutter/material.dart';








class SplashScreens extends StatefulWidget {

  @override
  _SplashScreenStates createState() => _SplashScreenStates();
}

class _SplashScreenStates extends State<SplashScreens>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;




  @override
  void initState() {
    super.initState();

    StorageUtil.openedApp().then((value) {
      ups = value;
    });


    _startAnimation();



  }



  openBefore  ups;








  //animated view.splash
  _startAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut)
      ..addListener(() {
        if (animationController.isCompleted) {


          StorageUtil.getUser().then((value) {
            if (value != null){
              RetrofitClientInstance.getInstance().reset();


              if (value?.data?.access_token != null){
                Navigator.of(context).pushNamedAndRemoveUntil(
                    PageRouteConstants.dashBoardScreen,(r)=>false);

              }
              else{
                Navigator.of(context).pushNamedAndRemoveUntil(
                    PageRouteConstants.stepperPage,(r)=>false);
              }

            }
            else
            if (value == null && ups != null && ups.openned == true ){
              Navigator.of(context).pushNamedAndRemoveUntil(
                  PageRouteConstants.view_page, (r) => false
              );
            }else {


              Navigator.of(context).pushNamedAndRemoveUntil(
                  PageRouteConstants.stepperPage, (r) => false
              );
            }

          });




        }

        setState(() {});
      });

    animationController.forward();

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(

      body: Stack(
        children: [





          Container(

            child:   Image.asset(
              'assets/images/back.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),


          Center(
            child:    Image.asset(

              'assets/images/logo_back.png',
              width: 238,height: 238,
            ),

          ),

          Center(


            child:    Image.asset(

              'assets/images/logo_white.png',
              width: animation.value * 150,
              height: animation.value * 150,

            ),

          ),
        ],
      )
    );


  }
}

