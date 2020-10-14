import 'package:flutter/material.dart';

class employee_memberlink extends StatefulWidget {
  @override
  _employee_memberlinkState createState() => _employee_memberlinkState();
}

class _employee_memberlinkState extends State<employee_memberlink> {
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
            'Requires Manager Approval',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
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
                  fontWeight: FontWeight.bold,
                  fontSize: 25,

                ),
                ),
                IconButton(
                  icon: Image.asset('assets/images/QR_CodeImage.png'),
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
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                ),
                Text('Manually Input',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                ),
                IconButton(
                  icon: Image.asset('assets/images/EditImage.png'),
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
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  textAlign: TextAlign.center,
                )
              ])))
        ])
    );
  }
}
