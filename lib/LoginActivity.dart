import 'package:flutter/material.dart';


class LoginActivity extends MaterialPageRoute<Null> {
  LoginActivity() : super(builder: (BuildContext context){
  return Scaffold(

    body: Container(
    decoration: BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.pink, Colors.deepOrangeAccent]),


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

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: <Widget>[


      Image(

        image: AssetImage('assets/images/DnD Logo.png'),
        width: 250,
        height: 250,
      ),

      SizedBox(height: 20 ),
      Text(
        'USERNAME',
        style: TextStyle(fontSize: 18, color: Colors.white),

      ),


      Container(
        width: 300,
        child: TextField(
          obscureText: false,

          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),

          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width:1.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width:1.0),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width:1.0),

            ),
          ),
        ),
      ),

      SizedBox(height: 20 ),
      Text(
        'PASSWORD',
        style: TextStyle(fontSize: 18, color: Colors.white),

      ),

      Container(
        width: 300,
        child: TextField(
          obscureText: true,

          style: TextStyle(
              fontSize: 20,
              color: Colors.white
          ),

          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width:1.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width:1.0),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width:1.0),

            ),
          ),
        ),
      ),
      SizedBox(height: 20 ),


      RaisedButton(onPressed: () {},
        child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.deepOrange)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
        ),

      ),


      FlatButton(onPressed: () {},
        child: Text(
            'Forgot Username or Password?',
            style: TextStyle(color: Colors.white)),
        highlightColor: Colors.deepOrangeAccent,
      ),


      FlatButton(onPressed: () {},
        child: Text(
            'No Account? SIGN UP',
            style: TextStyle(color: Colors.white)),
        highlightColor: Colors.deepOrangeAccent,
      ),
      SizedBox(height: 40 ),




    ],

    ),
    ),
    ),
    );
  });
}