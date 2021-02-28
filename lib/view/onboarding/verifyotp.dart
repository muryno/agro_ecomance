
import 'package:agro_ecomance/rxbloc_pattern/login_bloc.dart';
import 'package:agro_ecomance/utils/constants/page_route_constants.dart';
import 'package:agro_ecomance/utils/reuseable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class OTPScreen extends StatefulWidget {



  @override
  _Screen24State createState() => _Screen24State();
}

class _Screen24State extends State<OTPScreen>
    with TickerProviderStateMixin{

  AnimationController _controller;
  int levelClock = 60;



//resendotp

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
            levelClock) // gameData.levelClock is a user entered number elsewhere in the applciation
    );

    _controller.forward();



  }

  TextEditingController _otpController = TextEditingController(text: "");
  bool _hasError = false;


  String  otp_secret;






  @override
  Widget build(BuildContext context) {


    otp_secret = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          child: Column(
            children: [
              const SizedBox(
                height: 150.0,
              ),
              Text(
                "Verification",
                style: TextStyle(
                    fontSize: 22,
                    color: ReUseAble().getButtonColor(),
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40.0,
              ),
              Text(
                "You will receive an OTP via SMS",
                style: TextStyle(
                    // fontSize: 14,
                    // color: Color(0XFF3ABC124),
                    // fontWeight: FontWeight.bold
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24.0,
              ),
              PinCodeTextField(
                autofocus: true,
                controller: _otpController,
                hideCharacter: true,
                highlight: true,
                highlightColor: Colors.black54,
                defaultBorderColor: Colors.black26,
                hasTextBorderColor: ReUseAble().getButtonColor(),
                maxLength: 6,
                hasError: _hasError,
                maskCharacter: "*",
                onTextChanged: (text) {
                  setState(() {
                    _hasError = false;
                  });
                },
                onDone: (text) {
                  loginBloc.verifyOtp(otp_secret, int.parse(_otpController.text), context);
                  print("DONE $text");
                  print("DONE CONTROLLER ${_otpController.text}");
                },
                pinBoxWidth: 30,
                pinBoxHeight: 30,
                // hasUnderline: true,
                // wrapAlignment: WrapAlignment.spaceAround,

                pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 24.0,
              ),
              ButtonTheme(
                minWidth: 140,
                child: RaisedButton(
                  elevation: 0.0,
                  textColor: Colors.white,
                  color: ReUseAble().getButtonColor(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  child: Text("Verify"),
                  onPressed: () {

                    loginBloc.verifyOtp(otp_secret, int.parse(_otpController.text), context);


                  },
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              RichText(
                text: TextSpan(
                  text: "Didn't receive an OTP? ",
                  children: <InlineSpan>[
                    TextSpan(
                      text: "Resend OTP",
                      style: TextStyle(
                          color: ReUseAble().getButtonColor(),
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //resent OTP method here

                          loginBloc.resendotp(otp_secret, _otpController.text, context);

                        },
                    )
                  ],
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Time left ",style: TextStyle(color: Colors.black),),
                  Countdown(

                    animation: StepTween(

                      begin: levelClock, // THIS IS A USER ENTERED NUMBER
                      end: 0,
                    ).animate(_controller),
                  ),

                  const SizedBox(
                    width: 8.0,
                  ),
                  Text("|"),
                  const SizedBox(
                    width: 8.0,
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          PageRouteConstants.view_page,(r)=>false);
                    },
                    child:   Text("Go back"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';



    return Text(
      "$timerText",
      style: TextStyle(

        color: Colors.black,
      ),
    );
  }
}