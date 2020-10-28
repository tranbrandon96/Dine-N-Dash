import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/membership_card_screen.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:intl/intl.dart';

class ManualInputScreen extends StatefulWidget {
  _TableInfoScreen createState() => _TableInfoScreen();
}

class _TableInfoScreen extends State<ManualInputScreen> {
  final _customerIDController = TextEditingController();

  Widget build(BuildContext context) {
    String customerID = "0";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFFF0041),
              width: 2.2,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(),
                    Text(
                      'INPUT CUSTOMER ID',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.cancel,
                              size: 35, color: Color(0xFFFF0041)),
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Customer ID:',
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,),
                    ),
                    SizedBox(height: 15),
                    Container(
                        width: 150,
                        child: buildNumberTextField(_customerIDController)),
                  ],
                ),
                SizedBox(height: 5),
                RaisedButton(
                  onPressed: () {
                    customerID = _customerIDController.text;
                    Navigator.push(
                                   context,
                                   MaterialPageRoute(
                                       builder: (context) => ViewTableScreen()));
                  },
                  color: Color(0xFFFF0041),
                  child:
                      Text('CONTINUE', style: TextStyle(color: Colors.white)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///Function builds a text field with number input values for hint text and
///bool to obscure user input text.
Widget buildNumberTextField(TextEditingController controller) {
  RegExp regExp = new RegExp("[0-9]");
  return TextField(
    maxLength: 99,
    controller: controller,
    inputFormatters: [FilteringTextInputFormatter.allow(regExp)],
    keyboardType: TextInputType.number,
    style: TextStyle(fontSize: 18, color: Colors.black),
    decoration: InputDecoration(
      counterText: '',
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 1.0),
      ),
    ),
  );
}
