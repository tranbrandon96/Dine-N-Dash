import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/new_screens_update/cashpayment_dialog.dart';

class CheckoutScreen extends StatefulWidget{
  String _tableNumber;
  CheckoutScreen(String tableNumber){
    _tableNumber = tableNumber;
  }
  _CheckoutScreen createState() =>  _CheckoutScreen(_tableNumber);
}

class _CheckoutScreen extends State<CheckoutScreen>{
  String _tableNumber;
  String customerName = "Guest";
  String partySize = '1';
  bool checkoutOk = true;


  double subtotal = 0;
  double total = 0;
  double tax = 0;
  double taxRate = .10;

  Map<dynamic, dynamic>items = {};
  DatabaseReference db;

  List<Text> subTotalTextList = [];
  List<Text> taxTextList = [];
  List<Text> totalTextList = [];

  _CheckoutScreen(String tableNumber){
    _tableNumber = tableNumber;
    db = FirebaseDatabase.instance.reference().child("Tables").child("Table"+ tableNumber);
  }

  init(){
    super.initState();
  }


   build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left, color: Color(0xFFFF0041), size:35,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text( "Receipt",
            style: TextStyle(
            
            color: Colors.black,),),
          backgroundColor: Colors.white,
        ),
      ),
      body: itemView(),
    );
  }




   Widget itemView() {
    return  FutureBuilder(
        future:  db.once(),
        builder: (context, AsyncSnapshot<DataSnapshot> snapshot) {
          if (snapshot.hasData) {
            Map<dynamic, dynamic> values=snapshot.data.value;
            items= values["Items"];
          };
          if (items != null) {
            List lists = [];
            items.forEach((key, values) {
              lists.add(values);
              if(values["Status"] == 'Not Submitted'){checkoutOk = false;}
                subtotal = values["Price"] + subtotal;
              tax = subtotal * taxRate;
              total = subtotal + tax;
            });
            return Column(
                children:<Widget>[
                SizedBox(height: 10),
                Container(
                  height: 500,
                  child: new ListView.builder(
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
                  ),
                ),

                Divider(
                  color: Colors.grey,
                  height: 5,
                  thickness: 1,
                ),

                Container(
                  height: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:<Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:[
                          Row(
                            children:[Text("SUBTOTAL: \$"),Text(subtotal.toStringAsFixed(2))]),
                          Row(
                            children:[Text("TAX: \$"),Text((tax).toStringAsFixed(2))]),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[Text("TOTAL: \$"),Text(total.toStringAsFixed(2))]),
                        _payButton(checkoutOk),
                        ],
                  ),
                ),
                ],
            );
          }
          else {return
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[Center(child:Text("ADD TO YOUR ORDER"))]
            );
          }
        });
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

class _payButton extends StatelessWidget{
  bool checkoutOk;
  _payButton(bool checkoutOk){
    this.checkoutOk = checkoutOk;

  }
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        checkoutOk == false ?

        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text("There Are Not Submitted Items In Your Order"),
        ))
            :
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => cashpayment_dialog()));   },
      color:Color(0xFFFF0041),
      child: Text(
          'PAY',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }

}


