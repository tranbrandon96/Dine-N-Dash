import 'package:flutter/material.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';

class EmployeeAddCustomerIDScreen extends StatefulWidget {
  @override
  _EmployeeAddState createState() => _EmployeeAddState();
}

class _EmployeeAddState extends State<EmployeeAddCustomerIDScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: const Color(0xfffd1040) ,

          body: Column(children: [
            SizedBox(height: 40),
            IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel, size: 35,
                        color: Colors.white),

                  ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('Add Customer To Table',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontFamily: 'Futura',
                fontWeight: FontWeight.w600,
              ),
              ),
              SizedBox(height: 20),
                      Text('Table 12',
                        style: TextStyle(
                          color: Colors.white,
                          
                          fontSize: 25,
                          decoration: TextDecoration.underline,

                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Scan QR',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,

                        ),
                      ),
                      //Generate Table Number Information Here

                      IconButton(
                        icon: Image.asset('assets/images/QR_CodeImageWhite.png'),
                        iconSize: 200,
                        onPressed: () {},
                      ),
                    ],
                  )

//                  textColor: Colors.white,
//                  color: const Color(0xfffd1040),
//                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              ),
            ),

            Container(
              padding: EdgeInsets.all(0.0),
              child: Center(
                  child: Column(
                    children: <Widget>[

                      Text('Manually Input',
                        style: TextStyle(
                          color: Colors.white,
                         
                          fontSize: 25,
                        ),
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/NotepadWhite.png'),
                        iconSize: 200,
                        onPressed: () {},
                      ),
                    ],
                  )

//                  textColor: Colors.white,
//                  color: const Color(0xfffd1040),
//                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
              ),
            ),
            Container(
                padding: EdgeInsets.all(5.0),
                child: Center(
                    child: Column(children: <Widget>[
                      Text('Scan customers Dine n Dash QR code or \nenter customers info manually',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ])))
          ])
    ),
    );
  }
}