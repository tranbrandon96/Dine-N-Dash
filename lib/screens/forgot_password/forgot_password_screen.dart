import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String email = "";

  var _formKey = GlobalKey<FormState>();

  TextEditingController controller = new TextEditingController();

  void click() {
    this.email = controller.text;
    
                              if (_formKey.currentState.validate()) {
                                FirebaseAuth.instance
                                    .sendPasswordResetEmail(email: email)
                                    .then((value) => print("Check your email"));
                              }
                            
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title:
                Text("Reset Password", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black)),
        body: Center(
            child: Padding(
                padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      TextField(
                        controller: this.controller,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "Type Your Email:",
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.black)),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.done),
                            splashColor: Colors.blue,
                            tooltip: "Submit",
                            onPressed: this.click,
                          ),
                        ),
                      )
                    ])))));
  }
}
