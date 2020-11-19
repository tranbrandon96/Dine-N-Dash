import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/firebase/sign_in.dart';

TextEditingController firstName = TextEditingController();
TextEditingController lastName = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController phoneNumber= TextEditingController();
TextEditingController gender = TextEditingController();
TextEditingController birthday = TextEditingController();
TextEditingController password = TextEditingController();

class CustomerAccountCreationScreen extends StatefulWidget {
  @override
  _CustomerAccountCreationScreenState createState() =>
      _CustomerAccountCreationScreenState();
}

class _CustomerAccountCreationScreenState extends State<CustomerAccountCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
        AppBar(
          leading: Container(
            width: 500,
            height: 75,
          ),
          centerTitle: true,
          title: Text(
            "CREATE ACCOUNT",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red[500],
        ),

      body:  SingleChildScrollView(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.white]),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

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
              buildTextField(email, "Email", false),
              buildTextField(phoneNumber, "Mobile Number", false),
              buildTextField(gender, "Gender", false),
              buildTextField(birthday, "Birthday", false),
              buildTextField(password, "Password", true),
              SizedBox(height: 20),
              RegisterButton(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    ));
  }
}

class RegisterButton extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () async {
        if(firstName.text == ""){
          showSnackBar(context,"Account Creation Failed. Please Enter A First Name.");
        }
        else if(lastName.text == ""){
          showSnackBar(context,"Account Creation Failed. Please Enter A Last Name.");
        }
        else if(email.text == ""){
          showSnackBar(context,"Account Creation Failed. Please Enter A Valid Email.");
        }
        else if(password.text == "" || password.text.length < 6){
          showSnackBar(context,"Account Creation Failed. Please Password An Password With At Least 6 Characters.");
        }
        else {
          try {
            final newUserCredential = await _auth
                .createUserWithEmailAndPassword(
                email: email.text, password: password.text);
            if (newUserCredential != null) {
              if (newUserCredential.additionalUserInfo.isNewUser == true) {
                User newUser = newUserCredential.user;
                newUser.updateProfile(
                    displayName: (firstName.text + " " + lastName.text));
                //Add user to database
                DatabaseReference userDB = FirebaseDatabase.instance.reference()
                    .child("Users").child(newUser.uid)
                    .child("profile");
                userDB.set({
                  "userID": newUser.uid,
                  "userName": firstName.text + " " + lastName.text,
                  "userEmail": newUser.email
                });
              }
              Navigator.pop(context, 'Account Created');
            }
            else {
              showSnackBar(context,"Account Creation Failed");
            }
          } catch (e) {
            print(e);
            showSnackBar(context,"Account Creation Failed");
          }
        }
      },
      child: Text('REGISTER',
          style: TextStyle(color: Colors.deepOrange)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }

  void showSnackBar(BuildContext context, String text){
    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
          SnackBar(content: Text(text)));
  }
}

Widget buildTextField(TextEditingController input, String hint, bool obscure) {
  return Container(
    width: 300,
    child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: obscure,
        controller: input,
        style: TextStyle(fontSize: 18, color: Colors.black),
      inputFormatters: [FilteringTextInputFormatter.deny(
          new RegExp(r"\s\b|\b\s")
      )],
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
        ),
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
