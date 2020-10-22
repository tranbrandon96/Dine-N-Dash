cimport 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/screens/employee_screens/checkout_screen.dart';
import 'package:flutter_svg/svg.dart';

class ViewTableScreen extends StatefulWidget{
  _ViewTableScreen createState() =>  _ViewTableScreen();
}

class _ViewTableScreen extends State<ViewTableScreen>{
  List<ExpansionTile> menuItems = [
    ExpansionTile(
      title: Text('\t\tDouble Double'),
      subtitle: Text('\t\t + Animal Style' + '\n\t\t -  No Pickles'),
      trailing: Text('\$10.00\t\t'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            FlatButton(color:Colors.purple,onPressed: (){}, child:Text('DISCOUNT',style:TextStyle(color:Colors.white,fontSize:15))),
            FlatButton(color:Colors.orangeAccent,onPressed: (){}, child:Text('EDIT',style:TextStyle(color:Colors.white,fontSize:15))),
            FlatButton(color:Colors.red,onPressed: (){}, child:Text('REMOVE',style:TextStyle(color:Colors.white,fontSize:15))),
          ]
        )
      ],
    ),
  ];


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
          actions: [
            IconButton(
            icon: Icon(Icons.add, color: Color(0xFFFF0041), size:35,),
            onPressed: () {},
          ),
          ],
          title: Text( "Table 12",
            style: TextStyle(
              
              color: Colors.black,),),
          backgroundColor: Colors.white,
        ),
      ),
      body: Column(
        children:<Widget>[
          Container(
            height: 100,
            child: ListTile(
              leading: SvgPicture.asset(
                "assets/icons/user-1.svg",
                height: 65,
                width: 65,
              ),
              title: Text('John D.', style: TextStyle(fontSize: 25)),
              subtitle: Text('Party Size: 2'),
              trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children:[
                Text('Edit Table',
                    style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,)),
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.grey, size:25,),
                  onPressed: () {},
                ),
              ]),
            ),
          ),
          Container(
            height: 450,
            child: ListView(children: menuItems),
          ),

          Divider(
            color: Colors.grey,
            height: 5,
            thickness: 1,
          ),

          Container(
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget>[
                    _button('BALANCE PRINT', null),
                    _button('CHECKOUT', CheckoutScreen())

                  ],
                ),

              ],
            ),
          ),
        ],
      ),


    );
  }

  Widget _button(String text, Object page){
    return RaisedButton(
      onPressed: () { if(page != null){  Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => page));}  },
      color:Color(0xFFFF0041),
      child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize:15,fontWeight: FontWeight.bold)),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
    );
  }

}

