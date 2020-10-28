import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/new_screens_update/cashpayment_dialog.dart';

class CheckoutScreen extends StatefulWidget{
  _CheckoutScreen createState() =>  _CheckoutScreen();
}

class _CheckoutScreen extends State<CheckoutScreen>{
  List<ListTile> menuItems = [
  
  ListTile(
    title: Text('\t\tDouble Double'),
    subtitle: Text('\t\t + Animal Style' + '\n\t\t -  No Pickles'),
    trailing: Text('\$4.25\t\t'),
  ),
  ];

  List<Text> subTotalTextList =  [Text("SUBTOTAL: \$"),Text("4.25")];
  List<Text> taxTextList =  [Text("TAX: \$"),Text("0.10")];
  List<Text> totalTextList =  [Text("TOTAL: \$"),Text("4.35")];


  Widget build (BuildContext context){
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
      body: Column(
          children:<Widget>[
            SizedBox(height: 10),
            Container(
              height: 500,
                child: ListView(children: menuItems),
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
                          children:subTotalTextList),
                      Row(
                          children:taxTextList),
                        ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children:totalTextList),
                    _payButton(),
                  ],
                ),
            ),
          ],
        ),


    );
  }

  Widget _payButton(){
    return RaisedButton(
      onPressed: () {Navigator.push(
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

