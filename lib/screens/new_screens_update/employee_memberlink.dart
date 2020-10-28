import 'package:flutter/material.dart';

class ManagerApprovalScreen extends StatefulWidget {
  @override
  _ManagerApprovalScreenState createState() => _ManagerApprovalScreenState();
}

class _ManagerApprovalScreenState extends State<ManagerApprovalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
                      leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, size: 35),
              color: Colors.black,
              onPressed: () => Navigator.of(context).pop(),
            ),
          title: Text(
            'Please Get Manager Approval',
            style: TextStyle(

              color: Colors.black,
              fontFamily: 'Futura',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(children: [
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Center(
                child: Column(
              children: <Widget>[
                Text('Scan Manager QR Code',
                style: TextStyle(
                  
                  fontSize: 25,

                ),
                ),
                //Generate Table Number Information Here

                IconButton(
                  icon: Image.asset('assets/images/QR_CodeImage.png'),
                  iconSize: 230,
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
                SizedBox(height: 30),
                Text('Manually Input',
                    style: TextStyle(
                      
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
                      
                      fontSize: 15,
                    ),
                  textAlign: TextAlign.center,
                )
              ])))
        ])
    );
  }
}
