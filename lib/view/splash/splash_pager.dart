import 'package:agro_ecomance/utils/SliderModel.dart';
import 'package:agro_ecomance/utils/splash/stepper_ui.dart';
import 'package:flutter/material.dart';





class StepperPage extends StatefulWidget {
  @override
  _StepperPage createState() => _StepperPage();
}

class _StepperPage extends State<StepperPage> {

  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;



  @override
  void initState() {
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height ,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[

              StepperSlide(
                  imagePath: mySLides[1].getImageAssetPath(),
                  title: mySLides[1].getTitle(),
                  desc: mySLides[1].getDesc(),
                  controller: controller,
                  slideIndex: slideIndex
              ),
              StepperSlide(
                  imagePath: mySLides[2].getImageAssetPath(),
                  title: mySLides[2].getTitle(),
                  desc: mySLides[2].getDesc(),
                  controller: controller,
                  slideIndex: slideIndex
              ),
              StepperSlide(
                  imagePath: mySLides[0].getImageAssetPath(),
                  title: mySLides[0].getTitle(),
                  desc: mySLides[0].getDesc(),
                  controller: controller,
                  slideIndex: slideIndex
              ),
            ],
          ),
        ),



      ),

    );
  }
}