import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class RestaurantCreationActivity extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white]),


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
              Container(
                width: 500,
                height: 75,
                decoration: BoxDecoration(
                  color: Colors.red[500],
                ),

                child: Container(
                  child: Center(

                    child: Text(
                      "CREATE ACCOUNT",
                      style: TextStyle(
                          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
                      ),
                    ),

                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CONTINUE WITH",
                    style: TextStyle(
                        fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold
                    ),
                  ),

                  FlatButton(
                    child:  Image.asset("assets/images/Google.PNG"),
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {},

                  ),
                ],
              ),

              Text(
                " or continue with email",
                style: TextStyle(
                  fontSize: 12, color: Colors.black,
                ),
              ),


              buildTextField("Restaurant Name", false),

              buildTextField("Restaurant Address", false),

              buildTextField("Category", false),

              buildTextField("Phone", false),

              buildTextField("Website", false),

              buildTextField("Password", true),

              SizedBox(height: 20 ),


              RaisedButton(onPressed: () {},
                child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.deepOrange)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),

              ),

              SizedBox(height: 40 ),

            ],

          ),
        ),
      ),
    );
  }
}

Widget buildTextField(String hint,bool obscure){
  return
    Container(
      width: 300,
      child: TextField(
        obscureText: obscure,

        style: TextStyle(
            fontSize: 18,
            color: Colors.black
        ),

        decoration: InputDecoration(
          hintText: hint,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width:1.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width:1.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width:1.0),

          ),
        ),
      ),
    );
}