



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




    _startAnimation();



  }




  //animated view.splash
  _startAnimation() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation =
    CurvedAnimation(parent: animationController, curve: Curves.easeOut)
      ..addListener(() {
        if (animationController.isCompleted) {

          Navigator.of(context).pushNamedAndRemoveUntil(
              PageRouteConstants.dashBoardScreen, (r) => false
          );


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

