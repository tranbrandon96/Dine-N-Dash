import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TableInfoScreen extends StatefulWidget{
  String userID;
  String restaurantID;
  TableInfoScreen(this.userID,this.restaurantID);
  _TableInfoScreen createState() =>  _TableInfoScreen(userID,restaurantID);
}

class _TableInfoScreen extends State<TableInfoScreen> {
   final _tableNumberController = TextEditingController();
  final _partySizeController = TextEditingController();
  DatabaseReference databaseReference;
  final orderReference = FirebaseDatabase.instance.reference().child("Orders");
  String restaurantName = "";
  String partySize = "0";
  String tableNumber = "0";
  String date = "July 14, 2020";
  String checkIn = "0:00pm";
  String orderNumber = "00";
  String userID;
  String restaurantID;

  _TableInfoScreen(this.userID, this.restaurantID){
    databaseReference = FirebaseDatabase.instance.reference().child("Restaurant_Tables").child(restaurantID).child("Tables");
    getData();

  }

  void getData() async{
    await FirebaseDatabase.instance.reference().child("Restaurants").child(restaurantID).child("Name").once()
      .then((DataSnapshot dataSnapshot) {
    restaurantName = dataSnapshot.value;
  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:

      Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFFF0041),
              width:2.2,
            ),
            borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(0),

            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Text(
                        'TABLE INFO',
                        style: TextStyle(
                            fontSize: 23,
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
                    children: <Widget>[
                      Text(
                        'Table Number:',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Container(width: 50, child: buildNumberTextField(_tableNumberController)),
                    ],
                  ),

                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        //Added space to text to align with above text
                        'Party Size:\t\t\t\t\t',
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Container(width: 50, child: buildNumberTextField(_partySizeController)),
                    ],
                  ),
                  SizedBox(height: 5),
                  RaisedButton(
                    onPressed: () {
                      partySize = _partySizeController.text;
                      tableNumber = _tableNumberController.text;
                      checkIn = DateFormat('HH:mm').format(DateTime.now());
                      date = DateFormat('MMMM dd,yyyy').format(DateTime.now());
                      createData();
                      Navigator.pop(context);
                    },
                    color: Color(0xFFFF0041),
                    child: Text('CONTINUE',
                        style: TextStyle(color: Colors.white)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
    ),

    );
  }

  void createData(){
    DatabaseReference tableReference = databaseReference.child("Table"+tableNumber);
    orderNumber = orderReference.push().key;
    orderReference.child(orderNumber).set({
      'Restaurant_Name': restaurantName,
      'Date': date,
    });

    tableReference.set({
      'User_Name': 'Guest',
      'Party_Size': partySize,
      'Check_In': checkIn,
      'Table_Number': tableNumber,
      'employee_ID': userID,
      'Order_ID': orderNumber,
      'customer_ID':'',
    });
  }
}


///Function builds a text field with number input values for hint text and
///bool to obscure user input text.
Widget buildNumberTextField(TextEditingController controller) {
  RegExp regExp = new RegExp("[0-9]");
  return TextField(
      maxLength: 4,
      controller: controller,
      inputFormatters: [FilteringTextInputFormatter.allow(regExp)],
      keyboardType: TextInputType.number,
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

