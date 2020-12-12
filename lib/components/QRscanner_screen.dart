import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/MANUE/AndroidStudioProjects/Dine-N-Dash/lib/components/manual_input_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:firebase_database/firebase_database.dart';

class QRscanner_screen extends StatefulWidget {
  String _tableNumber;
  String restaurantID;
  QRscanner_screen(String tableNumber, this.restaurantID){
    _tableNumber = tableNumber;
  }
  @override
  _QRscanner_screen createState() => new _QRscanner_screen(_tableNumber,restaurantID);
}


class _QRscanner_screen extends State<QRscanner_screen> {
  DatabaseReference tableReference;
  DatabaseReference userReference = FirebaseDatabase.instance.reference().child("Users");
  String _tableNumber;
  String restaurantID;
  String qr;
  String orderID;
  String memberName = "John Doe";
  bool camState = true;
  bool scanned = false;

  _QRscanner_screen(String tableNumber, this.restaurantID){
    _tableNumber = tableNumber;
    tableReference = FirebaseDatabase.instance.reference().child('Restaurant_Tables').child(restaurantID).child("Tables").child("Table"+ tableNumber);
  }


  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:Container(
        height:MediaQuery.of(context).size.height/4,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFFF0041),
            width:2.2,
          ),
          borderRadius: BorderRadius.circular(12)),
        child: Center(
              child: selectUI(scanned),
        )
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child:Center(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: camState
                  ? QrCamera(
                          onError: (context, error) => Text(
                            error.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                          qrCodeCallback: (code) {
                            qr = code;

                            //Retrieve the customer's name from the database
                            DatabaseReference customerReference = userReference.child(qr).child("profile");
                            customerReference.once().then((DataSnapshot snapshot){
                              Map<dynamic, dynamic> values=snapshot.value;
                              memberName = values["userName"];
                            setState(() {

                              });

                              camState = false;
                              scanned = true;
                            });
                          }
                      )
                  : Container()
            ),
            Center(
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(30)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    )
    );
  }

  ///This widget returns the text belonging
  Widget scannerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(width:MediaQuery.of(context).size.width/8),
        Text(
          'Scanner',
          style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.cancel, size: 35,
                  color: Color(0xFFFF0041)),
            )),
      ],
    );
  }

  Widget manualInputUI() {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        scannerText(),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Scan Customer's QR code to add them to their table.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
        FlatButton(
          onPressed: () {
              displayModalBottomSheet(context,_tableNumber,restaurantID);
          },
          child: Text('ENTER CUSTOMER ID',
              style: TextStyle(fontSize:15, color: Color(0xFFFF0041))),
          highlightColor: Colors.white,
        )
      ]
    );
  }

  Widget customerScannedUI() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          scannerText(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/user-1.svg",
                height: 55,
                width: 55,
              ),
              SizedBox(width: 10,),
              Text(
                memberName,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
          ],
          ),

          RaisedButton(
            onPressed: () {//Update the table with the customer's info
              Map<String, Object> updateDoc = new HashMap();
              updateDoc['customer_ID'] = qr;
              updateDoc['User_Name'] = memberName;
              tableReference.update(updateDoc);
              Navigator.pop(context);
              },
            color: Color(0xFFFF0041),
            child: Text('ADD CUSTOMER',
                style: TextStyle(color: Colors.white)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          )
        ]
    );
  }

  Widget selectUI(bool scanned) {
    return scanned ? customerScannedUI() : manualInputUI();
  }

}

 ///This class is the setup for calling a modal bottomSheet.
  void displayModalBottomSheet(context,String _tableNumber,restaurantID) {
    var bottomSheetController =
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)),
        clipBehavior: Clip.hardEdge,
        isScrollControlled: true,

        context: context,
        builder: (BuildContext buildContext) {
          return SingleChildScrollView(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height:MediaQuery.of(context).size.height/4,
              color: Color(0xFF737373),
              child:ManualInputScreen(_tableNumber,restaurantID),
            ),
          );
        }
    );
  }