import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/employee_screens/view_table_screen.dart';
import 'package:flutter_app/screens/homepage_screen/homepage_screen.dart';
import 'package:flutter_app/screens/new_screens_update/kitchenconfirm_dialog.dart';

class ReviewOrderScreen extends StatefulWidget{
  _ReviewOrderScreen createState() =>  _ReviewOrderScreen();
}

class _ReviewOrderScreen extends State<ReviewOrderScreen>{
  List<ListTile> menuItems = [
    ListTile(
      title: Text('\t\tDouble Double'),
      subtitle: Text('\t\tAnimal Style, No Pickles'),
      trailing: Text('\$3.45\t\t'),
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
      onPressed: () {  
OrderSuccessfulPopup(context);}, 
       
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

//Alert Dialog - Pop-up notification
void OrderSuccessfulPopup(context) {
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
                                       Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()));
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