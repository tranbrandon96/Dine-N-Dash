import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class employee_checkout extends StatefulWidget {
  @override
  _employee_checkoutState createState() => _employee_checkoutState();
}

class _employee_checkoutState extends State<employee_checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.deepOrange),
        backgroundColor: Colors.white,
      ),
      body: Container(
          child: Center(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Method of Checkout?',
                      style: TextStyle(fontSize: 32, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Dine n' Dash",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    new Flexible(
                        child: FlatButton(
                            onPressed: null,
                            padding: EdgeInsets.all(5),
                            child: SvgPicture.asset('/assets/dndLogoPink.svg',width: 115, height: 115, color: Colors.deepOrange)
                        )
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Credit Card",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    new Flexible(
                        child: FlatButton(
                            onPressed: null,
                            padding: EdgeInsets.all(5),
                            child: SvgPicture.asset('/assets/creditCardBig.svg',width: 115, height: 115, color: Colors.deepOrange)
                        )
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Cash",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    new Flexible(
                        child: FlatButton(
                            onPressed: null,
                            padding: EdgeInsets.all(5),
                            child: SvgPicture.asset('/assets/cash.svg',width: 115, height: 115, color: Colors.deepOrange)
                        )
                    ),
                  ]
              )

          )
      ),
    );
  }
}