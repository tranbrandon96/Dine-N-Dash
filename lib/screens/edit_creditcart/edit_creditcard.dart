import 'dart:io' show Platform;
import 'package:flutter/material.dart';

import 'package:flutter_app/screens/add_creditcard/add_creditcard.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/google_pay_constants.dart' as google_pay_constants;

class EditCreditCard extends StatefulWidget {
  @override
  _EditCreditCardState createState() => _EditCreditCardState();
}

class _EditCreditCardState extends State<EditCreditCard> {
  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-GZyu_Xtq1HeEKahy1X8-Dg');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
      onCardEntryCancel: _cardEntryCancel,
    );
  }

  void _cardEntryCancel() {
    // Cancelled card entry
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {}

  // ------------------------------------------------------------------------------------//
 
  bool _googlePayEnabled = false;

  Future<void> _initSquarePayment() async {
      var canUseGooglePay = false;
      if(Platform.isAndroid) {
        // initialize the google pay with square location id
        // use test environment first to quick start
        await InAppPayments.initializeGooglePay(
          'LK4E5ZB0Q55F4', google_pay_constants.environmentTest);
        // always check if google pay supported on that device
        // before enable google pay
        canUseGooglePay = await InAppPayments.canUseGooglePay;
      }
      setState(() {
        
        _googlePayEnabled = canUseGooglePay;
        
      });
    }
  /** 
  * An event listener to start google pay flow
  */
  void _onStartGooglePay() async {
    try {
      await InAppPayments.requestGooglePayNonce(
        price: '1.00',
        currencyCode: 'USD',
        onGooglePayNonceRequestSuccess: _onGooglePayNonceRequestSuccess,
        onGooglePayNonceRequestFailure: _onGooglePayNonceRequestFailure,
        onGooglePayCanceled: _onGooglePayCancel, priceStatus: google_pay_constants.totalPriceStatusFinal);
    } on InAppPaymentsException catch(ex) {
      // handle the failure of starting apple pay
    }
  }

  /**
  * Callback when successfully get the card nonce details for processig
  * google pay sheet has been closed when this callback is invoked
  */
  void _onGooglePayNonceRequestSuccess(CardDetails result) async {
    try {
      // take payment with the card nonce details
      // you can take a charge
      // await chargeCard(result);

    } on Exception catch (ex) {
      // handle card nonce processing failure
    }
  }

  /**
  * Callback when google pay is canceled
  * google pay sheet has been closed when this callback is invoked
  */
  void _onGooglePayCancel() {
    // handle google pay canceled
  }

  /**
  * Callback when failed to get the card nonce
  * google pay sheet has been closed when this callback is invoked
  */
  void _onGooglePayNonceRequestFailure(ErrorInfo errorInfo) {
    // handle google pay failure
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfffd1040),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          title: Text(
            'Edit Payment Method',
            style: TextStyle(
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.all(40.0),
              child: Center(
                  child: Text(
                'Select Payment Type',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 25,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              )),
            ),

            ListTile(
                onTap: _pay,
                leading: Icon(
                  Icons.credit_card,
                ),
                title: Text("Credit Card"),
                trailing: Icon(Icons.arrow_right)),
            ListTile(
                leading: Image.asset('assets/images/PaypalImage.png',
                    scale: 1.0, height: 28.0),
                title: Text("Paypal"),
                trailing: Icon(Icons.arrow_right)),

            Container(
              padding: EdgeInsets.all(40.0),
              child: Center(
                  child: Text(
                'Please note that your payment method \n will not be charged until you make a purchase in a restaurant',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 15,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            // Container(
            //   padding: EdgeInsets.all(150.0),
            //   child: Center(
            //     child: RaisedButton(
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(25.0),
            //       ),
            //       onPressed: () {},
            //       child: Text('EDIT'),
            //       color: const Color(0xfffd1040),
            //       textColor: Colors.white,
            //     ),
            //   ),
            // ),
          ]),
        ));
  }
}
