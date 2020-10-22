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
  Future<void> _showChargeAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
                title: Text('Charge User Name?'),
                content: SvgPicture.asset(
                  "assets/icons/user-1.svg",
                  height: 135,
                  width: 135,
                ),
                actions: [
                  RaisedButton(
                      onPressed: () {},
                      child: Text(
                          'YES'
                      ),
                      color: const Color(0xfffd1040),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      )

                  ),
                  RaisedButton(
                      onPressed: () {},
                      child: Text(
                          'NO',
                        style: TextStyle(
                          color: const Color(0xfffd1040)
                        ),
                      ),
                      color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))
                    )
                  ),
                ],
              );
      },
    );
  }
}