//import 'package:doc_on_call247/utils/payment/create_access.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_paystack/flutter_paystack.dart';
//
//
//class CheckoutMethodBank extends StatefulWidget {
//  @override
//  _CheckoutMethodBankState createState() => _CheckoutMethodBankState();
//}
//
//class _CheckoutMethodBankState extends State<CheckoutMethodBank> {
//  bool isGeneratingCode = false;
//  @override
//  void initState() {
//    PaystackPlugin.initialize(
//        publicKey: "pk_test_b5ea48205fcd181ee3487efe2391ec999285356b");
//    super.initState();
//  }
//
//  Dialog successDialog(context) {
//    return Dialog(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(5.0)), //this right here
//      child: Container(
//        height: 350.0,
//        width: MediaQuery.of(context).size.width,
//        child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Icon(
//                Icons.check_box,
//                color: Color(0xFF41aa5e),
//                size: 90,
//              ),
//              SizedBox(height: 15),
//              Text(
//                'Payment has successfully',
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 17.0,
//                    fontWeight: FontWeight.bold),
//              ),
//              Text(
//                'been made',
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 17.0,
//                    fontWeight: FontWeight.bold),
//              ),
//              SizedBox(height: 15),
//              Text(
//                "Your payment has been successfully",
//                style: TextStyle(fontSize: 13),
//              ),
//              Text("processed.", style: TextStyle(fontSize: 13)),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  void _showDialog() {
//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return successDialog(context);
//      },
//    );
//  }
//
//  Dialog errorDialog(context) {
//    return Dialog(
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(5.0)), //this right here
//      child: Container(
//        height: 350.0,
//        width: MediaQuery.of(context).size.width,
//        child: Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Icon(
//                Icons.cancel,
//                color: Colors.red,
//                size: 90,
//              ),
//              SizedBox(height: 15),
//              Text(
//                'Failed to process payment',
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    color: Colors.black,
//                    fontSize: 17.0,
//                    fontWeight: FontWeight.bold),
//              ),
//              SizedBox(height: 15),
//              Text(
//                "Error in processing payment, please try again",
//                textAlign: TextAlign.center,
//                style: TextStyle(fontSize: 13),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//  void _showErrorDialog() {
//    // flutter defined function
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return errorDialog(context);
//      },
//    );
//  }
//
//  chargeCard() async {
//    setState(() {
//      isGeneratingCode = !isGeneratingCode;
//    });
//
//    Map accessCode = await createAccessCode("sk_test_94fd9a7241e410d2a4f8b8dc36b823a6e5199b56");
//
//    setState(() {
//      isGeneratingCode = !isGeneratingCode;
//    });
//
//    Charge charge = Charge()
//      ..amount = 10000
//      ..accessCode = accessCode["data"]["access_code"]
//      ..email = 'johnsonoye34@gmail.com';
//    CheckoutResponse response = await PaystackPlugin.checkout(
//      context,
//      method:
//      CheckoutMethod.bank, // Defaults to CheckoutMethod.selectable
//      charge: charge,
//    );
//    if (response.status == true) {
//      _showDialog();
//    } else {
//      _showErrorDialog();
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          "Check method method(selectable)",
//        ),
//        centerTitle: true,
//        elevation: 0.0,
//      ),
//      body: Container(
//          padding: EdgeInsets.all(10),
//          child: Center(
//            child: RaisedButton(
//              child: Text(
//                isGeneratingCode ? "Processing.." : "Charge",
//                style:
//                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//              ),
//              onPressed: () => chargeCard(),
//            ),
//          )),
//    );
//  }
//}
