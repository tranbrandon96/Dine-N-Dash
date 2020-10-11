import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class tables_screen extends StatefulWidget{
  _tables_screen createState() =>  _tables_screen();
}

class _tables_screen extends State<tables_screen>{
  List<ListTile> tableItems = [
    ListTile(
      leading: SvgPicture.asset(
        "assets/icons/user-1.svg",
      ),
      title: Text('User Name'),
      subtitle: Text('Check In: 12:00pm\nParty Size 4'),
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Table 14', style: TextStyle(fontSize: 20, color: Colors.grey),),
            Icon(Icons.keyboard_arrow_right)
          ]),

    ),
  ];

  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: SvgPicture.asset(
            "assets/icons/user-1.svg",
          ),
        title: Container(
          width:MediaQuery.of(context).size.width/2,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Color(0xFFFF0041), borderRadius: BorderRadius.circular(50)),
          child:Align(
            alignment: Alignment.center,
            child:Text( "TABLES",
            style: TextStyle(
            fontSize: 20,
            color: Colors.white,),
          ),),
        ),
        actions: [
          SvgPicture.asset(
            //credit card image wont show.
            //cant be used as button
            "assets/icons/user-1.svg",
            ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(children: tableItems),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child:SvgPicture.asset(
            "assets/icons/AddCustomerIcon.svg",
          ),
      ),
    );
  }
}

