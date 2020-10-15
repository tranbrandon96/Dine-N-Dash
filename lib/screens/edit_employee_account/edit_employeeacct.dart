import 'package:flutter/material.dart';
import 'package:flutter_app/firebase/sign_in.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';

class EditEmployeeAccount extends StatefulWidget {
  @override
  _EditEmployeeAccountState createState() => _EditEmployeeAccountState();
}

class _EditEmployeeAccountState extends State<EditEmployeeAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xfffd1040),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
                                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()));
            },
          ),
          title: Text(
            'Profile',
            style: TextStyle(

              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(imageUrl),
              ),
            
            Container(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: Text(
                'Change Profile Picture',
                style: TextStyle(
                  fontFamily: 'Futura',
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'First Name'),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Last Name'),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Email'),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: const Color(0xfffd1040)),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintText: 'Phone Number'),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            ),
            Container(
              padding: EdgeInsets.all(100.0),
              child: Center(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  onPressed: () {},
                  child: Text('EDIT ACCOUNT'),
                  color: const Color(0xfffd1040),
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
