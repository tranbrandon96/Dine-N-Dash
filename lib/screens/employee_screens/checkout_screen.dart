import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class checkout_screen extends StatefulWidget{
  _checkout_screen createState() =>  _checkout_screen();
}

class _checkout_screen extends State<checkout_screen>{
  List<ListTile> menuItems = [
  ListTile(
    title: Text('\t\tList item 1'),
    subtitle: Text('\t\titem details'),
    trailing: Text('\$10.00\t\t'),
  ),
  ];

  List<Text> subTotalTextList =  [Text("SUBTOTAL: \$"),Text("10.00")];
  List<Text> taxTextList =  [Text("TAX: \$"),Text("0.10")];
  List<Text> totalTextList =  [Text("TOTAL: \$"),Text("10.10")];


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
            fontSize: 35,
            color: Colors.black,),),
          backgroundColor: Colors.white,
        ),
      ),
      body: Column(
          children:<Widget>[
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
                height: 150,
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
      onPressed: () {   },
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

