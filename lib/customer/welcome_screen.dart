import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/customer/customer_sign_in_screen.dart';
import 'package:flutter_app/screens/sign_in/employee_sign_in_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WelcomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFF0041), Color(0xFFFB8E40)]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              SizedBox(height: 60),
              Text(
                'Welcome to Dine n Dash',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SvgPicture.asset(
                "assets/images/DnDLogo.svg",
                width: 150,
                height: 150,
              ),
              
              Text(
                'WHERE DINING MEETS DASHING',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
                            Text(
                'Are you an Employee?',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmployeeSignInScreen()));
                },
                child: Text('YES', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.white)),
              ),
             
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomerSignInScreen()));
                },
                child: Text('NO', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
