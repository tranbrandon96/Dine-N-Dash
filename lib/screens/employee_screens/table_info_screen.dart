import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/membership_card_screen.dart';

class TableInfoScreen extends StatefulWidget{
  _TableInfoScreen createState() =>  _TableInfoScreen();
}

class _TableInfoScreen extends State<TableInfoScreen> {
  TextField _tableNumberField = buildNumberTextField();
  TextField _partySizeField = buildNumberTextField();

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:

      Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFFF0041),
              width:2.2,
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
                        'TABLE INFO',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel, size: 35,
                                color: Color(0xFFFF0041)),
                          )),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Table Number:',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Container(width: 50, child: _tableNumberField),
                    ],
                  ),

                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        //Added space to text to align with above text
                        'Party Size:\t\t\t\t\t',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Container(width: 50, child: _partySizeField),
                    ],
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    onPressed: () {
                      MaterialPageRoute(
                          builder: (context) => membership_card_screen());
                    },
                    color: Color(0xFFFF0041),
                    child: Text('CONTINUE',
                        style: TextStyle(color: Colors.white)),
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
Widget buildNumberTextField() {
  RegExp regExp = new RegExp("[0-9]");
  return TextField(
      maxLength: 4,
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

