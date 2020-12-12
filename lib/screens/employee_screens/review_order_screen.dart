import 'dart:collection';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';
import 'package:flutter_app/screens/new_screens_update/kitchenconfirm_dialog.dart';

class ReviewOrderScreen extends StatefulWidget{
  String _tableNumber;
  String orderID;
  String restaurantID;
  ReviewOrderScreen(String tableNumber, this.restaurantID, this.orderID){
    _tableNumber = tableNumber;
  }
  _ReviewOrderScreen createState() =>  _ReviewOrderScreen(_tableNumber,restaurantID, orderID);
}

class _ReviewOrderScreen extends State<ReviewOrderScreen>{
  String _tableNumber;
  bool submittable = false;
  DatabaseReference orderReference;
  String orderID;
  String restaurantID;
  Map<dynamic, dynamic>items = {};

  _ReviewOrderScreen(String tableNumber, this.restaurantID, this.orderID){
    _tableNumber = tableNumber;
    orderReference = FirebaseDatabase.instance.reference().child("Orders").child(orderID);
  }

  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
          color: Color(0xFFFF0041),
          width:2.2,
          ),
          borderRadius: BorderRadius.circular(12)),

          child: SingleChildScrollView(
            child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width:MediaQuery.of(context).size.width/6),
                  Text(
                    'Review Order',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel, size: 35,
                        color: Color(0xFFFF0041)),
                  )
                ],
              ),
              Container(
                height: 550,
                child: itemView(),
              ),

              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ _submitButton() ],

                ),
              ),
            ],
          ),
      ),
      )


    );
  }

  Widget _submitButton(){
    return Builder(
        builder: (context) => RaisedButton(
          onPressed: () {

          if(submittable == true) {
            OrderSuccessfulPopup(context, _tableNumber, orderID);
          }
          else{
              Scaffold.of(context).showSnackBar(new SnackBar(
                content: new Text("There Are No Items to Submit"),
              ));
          }
          },
          color:Color(0xFFFF0041),
          child: Text(
              'SUBMIT',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        )
    );
  }

  Widget itemView() {
    return  FutureBuilder(
        future:  orderReference.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> values=snapshot.data.value;
            items= values["Items"];
          if (items != null) {
            List lists = [];
            items.forEach((key, values) {
              if (values["Status"] == 'Not Submitted') {
                lists.add(values);
              }
              submittable = lists.isNotEmpty ? true : false;
            });
            if(lists.isNotEmpty){
            return  new ListView.builder(
                      shrinkWrap: true,
                      itemCount: lists.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                            children:[
                              ListTile(
                                title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:[
                                      Text('\t\t'+ lists[index]['Item_Name']+'\n\t\t'+
                                          "Status: "+ lists[index]["Status"].toString()),
                                      Text("Qty: "+ lists[index]["Quantity"].toString()+"\t\t"),
                                    ]),
                                subtitle: Column(
                                  children: modificationBuilder(lists[index]["Modifications"]),
                                ),
                                trailing: Text('\$'+ lists[index]["Price"].toStringAsFixed(2) + '\t\t'),
                              ),

                              (index != lists.length - 1) ?
                              Divider(
                                color: Colors.grey,
                                height: 5,
                                indent: MediaQuery.of(context).size.width/9,
                                endIndent: MediaQuery.of(context).size.width/9,
                                thickness: 1,
                              ) : Container()

                            ]
                        );
                      }
                  );
          }}}
          return
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[Center(child:Text("ADD TO YOUR ORDER"))]
            );
          }
        );
  }

  List<Widget> modificationBuilder(Map<dynamic, dynamic> modifications){
    List<Widget> lists = [];
    if(modifications != null) {
      modifications.forEach((key, values) {
        if(values == true){
          lists.add(Text("\t\t"+key.toString()));
        }
      });
    }
    return lists;
  }
}

//Alert Dialog - Pop-up notification
void OrderSuccessfulPopup(BuildContext context, String tableNumber, String orderID) {
  showDialog(context: context, builder: (BuildContext bc) {
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        
      ),
      title: Text('Order Submitted \nSuccessfully!', textAlign: TextAlign.center,),
      content: ImageIcon(AssetImage("assets/images/chefhat.png"),
        color: const Color(0xfffd1040),
        size: 100,),
      actions: [
              Container(
                padding: EdgeInsets.fromLTRB(0,0,100,0),
                child: Center(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    onPressed: () {
                      DatabaseReference db = FirebaseDatabase.instance.reference().child("Orders").child(orderID).child('Items');
                      db.once().then((snapshot) {
                        if (snapshot != null) {
                          Map<String,dynamic> updateDoc = Map<String, dynamic>.from(snapshot.value);
                          updateDoc.forEach((key, values) {
                            if (values["Status"] == 'Not Submitted') {
                              updateDoc[key]['Status'] = "Submitted";
                              print(updateDoc);
                            }
                            db.update(updateDoc);

                          });
                        }
                      });


                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }), ModalRoute.withName('/'));
        },
                    child: Text(
                        'DONE'
                    ),
                    textColor: Colors.white,
                    color: const Color(0xfffd1040),
                  ),

                ),
              ),
  ],
    );
  });
}
