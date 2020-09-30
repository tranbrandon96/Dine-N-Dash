import 'package:flutter/material.dart';

class edit_employeeacct extends StatefulWidget {
  @override
  _edit_employeeacctState createState() => _edit_employeeacctState();
}

class _edit_employeeacctState extends State<edit_employeeacct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          color: const Color(0xfffd1040),
          onPressed: () {},
        ),
        title: Text(
          'Employee Account Info',
          style: TextStyle(
            fontSize: 28.0,
            fontFamily: 'Futura',
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(80.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: const AssetImage('assets/images/ProfilePicture.png'),
                ),
              ),
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
