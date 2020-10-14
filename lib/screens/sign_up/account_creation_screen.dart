import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  String firstName;
String lastName;
String email;
String phoneNumber;
String gender;
String birthday;
String password;

class AccountCreationActivity extends StatefulWidget {
  @override
  _AccountCreationActivityState createState() =>
      _AccountCreationActivityState();
}

class _AccountCreationActivityState extends State<AccountCreationActivity> {


  final _auth = FirebaseAuth.instance;

  @override
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
              AppBar(
                centerTitle: true,
                title: Text('CREATE ACCOUNT'),
                backgroundColor: Color(0xFFFF0041),
              ),
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
              buildTextField(firstName, "First Name", false),
              buildTextField(lastName, "Last Name", false),
              Container(
    width: 300,
    child: TextField(
        keyboardType: TextInputType.emailAddress,
        
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Email',
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
        onChanged: (value) {
          email = value;
        }),
  ),
              buildTextField(phoneNumber, "Mobile Number", false),
              buildTextField(gender, "Gender", false),
              buildTextField(birthday, "Birthday", false),
              Container(
    width: 300,
    child: TextField(
        keyboardType: TextInputType.emailAddress,
        
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          hintText: 'Password',
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
        onChanged: (value) {
          password = value;
        }),
  ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, FirstScreen.id);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
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

Widget buildTextField(String input, String hint, bool obscure) {
  return Container(
    width: 300,
    child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscure,
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          hintText: hint,
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
        onChanged: (value) {
          input = value;
        }),
  );
}

class FirstScreen extends StatefulWidget {
  static const String id = 'first_screen';
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFFFF0041), Color(0xFFFB8E40)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                'John',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                'doe',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {},
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style:
                        TextStyle(fontSize: 25, color: Colors.deepOrangeAccent),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
