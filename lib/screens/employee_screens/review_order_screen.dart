import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

class review_order_screen extends StatefulWidget{
  _review_order_screen createState() =>  _review_order_screen();
}

class _review_order_screen extends State<review_order_screen>{
  List<ListTile> menuItems = [
    ListTile(
      title: Text('\t\tList item 1'),
      subtitle: Text('\t\titem details'),
      trailing: Text('\$10.00\t\t'),
    ),
  ];

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

          child: Column(
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
                height: 500,
                child: ListView(children: menuItems),
              ),

              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ _submitButton() ],

                ),
              ),
            ],
          ),
      ),


    );
  }

  Widget _submitButton(){
    return RaisedButton(
      onPressed: () {   },
      color:Color(0xFFFF0041),
      child: Text(
          'SUBMIT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
    );
  }

}

