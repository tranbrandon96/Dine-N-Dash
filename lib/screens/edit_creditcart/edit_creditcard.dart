import 'package:flutter/material.dart';

class edit_creditcard extends StatefulWidget {
  @override
  _edit_creditcardState createState() => _edit_creditcardState();
}

class _edit_creditcardState extends State<edit_creditcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xfffd1040),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          title: Text(
            'Edit Payment Method',
            style: TextStyle(
              fontSize: 28.0,
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
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: FractionalOffset.centerLeft,
                  image: const AssetImage('assets/images/CreditCard.png'),
                ),
              ),
              child: Center(
                  child: Text(
                'Credit Card',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 25,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: FractionalOffset.centerLeft,
                  image: const AssetImage('assets/images/PaypalImage.png'),
                ),
              ),
              child: Center(
                  child: Text(
                'Paypal',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 25,
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )),
            ),
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
            Container(
              padding: EdgeInsets.all(150.0),
              child: Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {},
                  child: Text('EDIT'),
                  color: const Color(0xfffd1040),
                  textColor: Colors.white,
                ),
              ),
            ),
          ]),
        ));
  }
}
