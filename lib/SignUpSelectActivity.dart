import 'package:flutter/material.dart';
import 'package:flutter_app/AccountCreationActivity.dart';

class SignUpSelectActivity extends StatelessWidget {
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

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[
              Image(
                image: AssetImage("assets/images/DnD Logo.PNG"),
                width: 250,
                height: 250,
              ),
              SizedBox(height: 20),
              Text(
                'USE FOR:',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountCreationActivity()));
                },
                child: Text('Customer',
                    style: TextStyle(color: Colors.deepOrange)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountCreationActivity()));
                },
                child: Text('Employee',
                    style: TextStyle(color: Colors.deepOrange)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
