import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class account_creation_screen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(
          leading: Container(
            width: 500,
            height: 75,
          ),
          centerTitle: true,
          title: Text(
            "CREATE ACCOUNT",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red[500],
        ),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CONTINUE WITH",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  FlatButton(
                    child: Image.asset("assets/images/Google.PNG"),
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},
                  ),
                ],
              ),
              Text(
                " or continue with email",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
              buildTextField("First Name", false),
              buildTextField("Last Name", false),
              buildTextField("Email", false),
              buildTextField("Mobile Number", false),
              buildTextField("Gender", false),
              buildTextField("Birthday", false),
              buildTextField("Password", true),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {},
                child: Text('Continue',
                    style: TextStyle(color: Colors.deepOrange)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

///Function builds a text field with input values for hint text and
///bool to obscure user input text.
Widget buildTextField(String hintText, bool obscureText) {
  return Container(
    width: 300,
    child: TextField(
      obscureText: obscureText,
      style: TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        hintText: hintText,
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
    ),
  );
}
