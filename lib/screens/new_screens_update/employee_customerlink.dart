import 'package:flutter/material.dart';

class employee_customerlink extends StatefulWidget {
  @override
  _employee_customerlinkState createState() => _employee_customerlinkState();
}

class _employee_customerlinkState extends State<employee_customerlink> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        backgroundColor: const Color(0xfffd1040) ,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xfffd1040),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
            title: Text(
              'Add Customer To Table',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontFamily: 'Futura',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          body: Column(children: [
            Container(
              padding: EdgeInsets.all(5.0),
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('Scan Manager QR Code',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                      Text('OR',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text('Manually Input',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
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
                      Text('Must obtain Manager Approval\n in order to provide discount',
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