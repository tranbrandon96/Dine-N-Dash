import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/screens/sign_up/account_creation_screen.dart';

class member_type_screen extends StatelessWidget {
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
              SvgPicture.asset(
                "assets/images/DnDLogo.svg",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 50),
              Text(
                'USE FOR:',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(height: 50),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => account_creation_screen()));
                },
                child: Text('CUSTOMER', style: TextStyle(color: Colors.white)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.white)),
              ),
              SizedBox(height: 25),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => account_creation_screen()));
                },
                child: Text('EMPLOYEE', style: TextStyle(color: Colors.white)),
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
