import 'package:flutter/material.dart';
import 'package:flutter_app/components/membership_card_screen.dart';
import 'package:flutter_app/firebase/sign_in.dart';
import 'package:flutter_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';

import 'package:flutter_app/screens/employee_screens/checkout_screen.dart';
import 'package:flutter_app/screens/employee_screens/review_order_screen.dart';
import 'package:flutter_app/screens/employee_screens/table_info_screen.dart';
import 'package:flutter_app/screens/employee_screens/tables_screen.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_app/screens/sign_up/employee_account_creation_screen.dart';
import 'package:flutter_app/screens/sign_up/member_type_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmployeeSignInScreen extends StatefulWidget {
  EmployeeSignInScreen({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _EmployeeSignInScreen createState() => _EmployeeSignInScreen();
}

class _EmployeeSignInScreen extends State<EmployeeSignInScreen> {
  final _auth = FirebaseAuth.instance;
  String employeeEmail;
  String password;

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
     // floatingActionButton: _floatingActionButtonTester(),

      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xFFFF0041), Color(0xFFFB8E40)]),
          ),

        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: <Widget>[
              Spacer(),
              SvgPicture.asset(
                "assets/images/DnDLogo.svg",
                width: 150,
                height: 150,
              ),
              SizedBox(height: 60),
              Text(
                'EMAIL/USERNAME',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Container(
                width: 300,
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    obscureText: false,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                    ),
                    onChanged: (value) {
                      employeeEmail = value;
                    }),
              ),
              SizedBox(height: 20),
              Text(
                'PASSWORD',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              Container(
                width: 300,
                child: TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1.0),
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
                    final user = await _auth.signInWithEmailAndPassword(
                        email: employeeEmail, password: password);
                    if (user != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child:
                    Text('LOGIN', style: TextStyle(color: Colors.deepOrange)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              SizedBox(height: 10),
              _signInButton(),
              FlatButton(
                onPressed: () {
                                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text('FORGOT PASSWORD?',
                    style: TextStyle(color: Colors.white)),
                highlightColor: Colors.deepOrangeAccent,
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EmployeeAccountCreationScreen()));
                },
                child: Text('NO ACCOUNT? SIGN UP',
                    style: TextStyle(color: Colors.white)),
                highlightColor: Colors.deepOrangeAccent,
              ),
              SizedBox(height: 40),
            ],
          ),
        ),),
      ),
    );
  }


  ///This class is to test new screens using FAB on press.
  ///Feel free to use.
  // Widget _floatingActionButtonTester(){
  //   return FloatingActionButton(
  //     onPressed: (){

  //       //Sends to designated page
  //       Navigator.of(context).push(
  //         MaterialPageRoute(
  //           builder: (context) {
  //             //return checkout_screen();
  //             //return review_order_screen();
  //             return TableInfoScreen();
  //             //return view_table_screen();
  //           },
  //         ),
  //       );

  //     }
  //   );
  // }

  ///This button is to go to main page after login.
  Widget _loginButton(){
      return RaisedButton(
        onPressed: () { Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return membership_card_screen();
            },
          ),
        );   },

        child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.deepOrange)),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.white,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

