import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/QR_component.dart';

class membership_card_screen extends StatelessWidget {
  String memberID;
  String memberName;

  membership_card_screen(){
    memberID = '7HSGD930GJAJADMG39J';
    memberName = 'John Doe';
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
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.

          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).

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
