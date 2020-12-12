import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ManualInputScreen extends StatefulWidget {
  String _tableNumber;
  String restaurantID;
  _TableInfoScreen createState() => _TableInfoScreen(_tableNumber,restaurantID);
  ManualInputScreen(String tableNumber,this.restaurantID){
   _tableNumber = tableNumber;
  }

}

class _TableInfoScreen extends State<ManualInputScreen> {
  final _customerIDController = TextEditingController();
  DatabaseReference tableReference;
  DatabaseReference userReference = FirebaseDatabase.instance.reference().child(
      "Users");
  String memberName = "John Doe";
  String customerID;
  String restaurantID;
  bool scanned = false;

  _TableInfoScreen(String tableNumber, this.restaurantID) {
    tableReference =
        FirebaseDatabase.instance.reference().child('Restaurant_Tables').child(
            restaurantID).child("Tables").child("Table" + tableNumber);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFFF0041),
              width: 2.2,
            ),
            borderRadius: BorderRadius.circular(12)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: selectUI(scanned),
        ),
      ),
    );
  }

  Widget selectUI(bool scanned) {
    return scanned ? customerScannedUI() : inputUI();
  }

  Widget inputUI() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(),
              Text(
                'INPUT CUSTOMER ID',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel,
                        size: 35, color: Color(0xFFFF0041)),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Customer ID:',
                style: TextStyle(
                  fontSize: 23,
                  color: Colors.black,),
              ),
              SizedBox(height: 15),
              Container(
                  width: 150,
                  child: buildNumberTextField(_customerIDController)),
            ],
          ),
          SizedBox(height: 5),
          RaisedButton(
            onPressed: () {
              customerID = _customerIDController.text;
              userReference.child(customerID).child("profile")
                  .once()
                  .then((DataSnapshot snapshot) {
                if (snapshot.value != null){
                  print(snapshot.value);
                  memberName = snapshot.value['userName'];
                scanned = true;
                setState(() {  });}
                else{scanned = false;}
              });
            },
            color: Color(0xFFFF0041),
            child:
            Text('CONTINUE', style: TextStyle(color: Colors.white)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget customerScannedUI() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(width: MediaQuery
                  .of(context)
                  .size
                  .width / 8),
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
          ),
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
            onPressed: () { //Update the table with the customer's info
              Map<String, Object> updateDoc = new HashMap();
              updateDoc['customer_ID'] = customerID;
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

  ///Function builds a text field
  Widget buildNumberTextField(TextEditingController controller) {
    return TextField(
      maxLength: 99,
      controller: controller,
      style: TextStyle(fontSize: 18, color: Colors.black),
      decoration: InputDecoration(
        counterText: '',
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
    );
  }
}
