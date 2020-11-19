import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/QR_component.dart';
import 'package:firebase_auth/firebase_auth.dart';

class membership_card_screen extends StatelessWidget {
  String memberID = "";
  String memberName = "";

  membership_card_screen(){
    final FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    memberID = user.uid;
    memberName = user.displayName;
  }

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
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel, size: 35, color: Colors.white),
                  )),
              Text(
                'CUSTOMER CHECK IN',
                style: TextStyle(fontSize: 27, color: Colors.white),
              ),
              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height/1.8,
                width: MediaQuery.of(context).size.width/1.3,
                
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  margin: EdgeInsets.only(left:10,right:10,top:20,bottom:10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          'Member Card',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFFF0041),
                              fontWeight: FontWeight.bold),
                        ),
                        QR_component(memberID,context),
                        Column(
                          children: [
                            Text(
                              memberName,
                              style: TextStyle(
                                  fontSize: 27,
                                  color: Color(0xFFFF0041),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              memberID,
                              style:
                              TextStyle(fontSize: 15, color: Color(0xFFFF0041)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Scan when arriving to restaurant to get the Dine n' Dash experience!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
