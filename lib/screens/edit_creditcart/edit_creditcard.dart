import 'package:flutter/material.dart';
import 'package:flutter_app/screens/add_creditcard/add_creditcard.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';

class EditCreditCard extends StatefulWidget {
  @override
  _EditCreditCardState createState() => _EditCreditCardState();
}

class _EditCreditCardState extends State<EditCreditCard> {
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
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
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
              onTap: () {
            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddCreditCard()));
        },
              
              leading: Icon(Icons.credit_card, ),
              title: Text("Credit Card"),
              trailing: Icon(Icons.arrow_right)
            ),
            ListTile(
              leading: Image.asset('assets/images/PaypalImage.png', scale: 1.0, height: 28.0),
              title: Text("Paypal"),
              trailing: Icon(Icons.arrow_right)
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
